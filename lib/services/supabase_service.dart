import 'package:supabase_flutter/supabase_flutter.dart';

/// Singleton accessor for the Supabase client.
class SupabaseService {
  SupabaseService._();

  static SupabaseClient get client => Supabase.instance.client;

  static User? get currentUser => client.auth.currentUser;

  static Session? get currentSession => client.auth.currentSession;

  static bool get isLoggedIn => currentUser != null;
}
