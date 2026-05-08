import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import '../models/user.dart';
import '../services/auth_service.dart';
import '../services/supabase_service.dart';

class AuthProvider extends ChangeNotifier {
  User _user = const User(id: '', name: '', email: '', phone: '', address: '');
  bool _isLoading = false;
  String? _error;

  final _authService = AuthService();

  User get user => _user;
  bool get isLoggedIn => _user.isAuthenticated;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // ── Session ───────────────────────────────────────────────────────────────

  /// Called once at app startup (from SplashScreen) to restore any active session.
  Future<void> initializeSession() async {
    final session = SupabaseService.currentSession;
    if (session != null) {
      await _loadProfile(session.user.id, session.user.email ?? '');
    }
  }

  Future<void> _loadProfile(String userId, String fallbackEmail) async {
    try {
      final profile = await _authService.fetchUserProfile(userId);
      _user = profile ??
          User(
            id: userId,
            name: '',
            email: fallbackEmail,
            phone: '',
            address: '',
          );
    } catch (_) {
      _user =
          User(id: userId, name: '', email: fallbackEmail, phone: '', address: '');
    }
    notifyListeners();
  }

  // ── Auth ops ──────────────────────────────────────────────────────────────

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _authService.signIn(email, password);
      if (response.user != null) {
        await _loadProfile(response.user!.id, email);
      }
    } on AuthException catch (e) {
      _error = e.message;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signup(
    String name,
    String email,
    String phone,
    String password,
  ) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final response = await _authService.signUp(name, email, phone, password);
      if (response.user != null) {
        _user = User(
          id: response.user!.id,
          name: name,
          email: email,
          phone: phone,
          address: '',
        );
        notifyListeners();
      }
    } on AuthException catch (e) {
      _error = e.message;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
    _user = const User(id: '', name: '', email: '', phone: '', address: '');
    _error = null;
    notifyListeners();
  }
}
