import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user.dart' as app;
import 'supabase_service.dart';

/// Handles all Supabase Auth and user-profile operations.
class AuthService {
  final _client = SupabaseService.client;

  // ── Auth ──────────────────────────────────────────────────────────────────

  Future<AuthResponse> signIn(String email, String password) {
    return _client.auth.signInWithPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<AuthResponse> signUp(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    // Do NOT pass 'data' metadata here — on Flutter Web, Supabase encodes
    // metadata into an HTTP header which throws:
    //   "String contains non ISO-8859-1 code point"
    // Instead we write the profile row separately after auth succeeds.
    final response = await _client.auth.signUp(
      email: email.trim(),
      password: password,
    );

    // If signup succeeded and we have a user ID, upsert the profile row.
    final uid = response.user?.id;
    if (uid != null) {
      try {
        await _client.from('users').upsert({
          'id': uid,
          'name': name.trim(),
          'email': email.trim(),
          'phone': phone.trim(),
          'address': '',
        });
      } catch (_) {
        // Profile write failure is non-fatal — auth still succeeded.
      }
    }

    return response;
  }

  Future<void> signOut() => _client.auth.signOut();

  Future<void> sendPasswordReset(String email) =>
      _client.auth.resetPasswordForEmail(email.trim());

  // ── Profile ───────────────────────────────────────────────────────────────

  /// Fetch the user's profile row from `public.users`.
  Future<app.User?> fetchUserProfile(String userId) async {
    final data = await _client
        .from('users')
        .select()
        .eq('id', userId)
        .maybeSingle();

    if (data == null) return null;

    return app.User(
      id: data['id'] as String,
      name: (data['name'] as String?) ?? '',
      email: (data['email'] as String?) ?? '',
      phone: (data['phone'] as String?) ?? '',
      address: (data['address'] as String?) ?? '',
    );
  }

  /// Update mutable profile fields in `public.users`.
  Future<void> updateUserProfile(
    String userId, {
    String? name,
    String? phone,
    String? address,
  }) async {
    final updates = <String, dynamic>{};
    if (name != null) updates['name'] = name;
    if (phone != null) updates['phone'] = phone;
    if (address != null) updates['address'] = address;
    if (updates.isEmpty) return;
    await _client.from('users').update(updates).eq('id', userId);
  }
}
