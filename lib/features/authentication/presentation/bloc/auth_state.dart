part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

/// Initial state when the app is first opened before the auth status is checked.
final class AuthInitial extends AuthState {}

/// Emitted during login or session-checking operations.
final class AuthLoading extends AuthState {}

/// Emitted when a valid session/user exists.
final class AuthSuccess extends AuthState {
  final UserEntity userEntity;

  AuthSuccess({required this.userEntity});
}

/// Emitted when there is no active session or the user logs out.
/// (Distinct from AuthFailure, which indicates an error like wrong credentials).
final class AuthUnauthenticated extends AuthState {}

/// Emitted when an error occurs during authentication (e.g. wrong password, network error).
final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({required this.message});
}
