part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class EmailLoginRequested extends AuthEvent {
  final String email;
  final String password;

  EmailLoginRequested({required this.email, required this.password});
}

// Added to handle the background stream from Supabase Auth
class AuthUserChanged extends AuthEvent {
  final UserEntity? user;

  AuthUserChanged(this.user);
}
