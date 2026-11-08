import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton()
class RemoteDatasource {
  final SupabaseClient _supabaseClient;

  const RemoteDatasource({required this._supabaseClient});

  // Expose the raw Supabase auth stream
  Stream<AuthState> get authStateChanges =>
      _supabaseClient.auth.onAuthStateChange;

  // Expose the current user / session
  User? get currentUser => _supabaseClient.auth.currentUser;
  Session? get currentSession => _supabaseClient.auth.currentSession;

  Future<AuthResponse> emailLogin({
    required String email,
    required String password,
  }) async {
    return await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }
}
