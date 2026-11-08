import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:wayve/core/errors/failure.dart';
import 'package:wayve/core/errors/results.dart';
import 'package:wayve/features/authentication/domain/entity/user.dart';
import 'package:wayve/features/authentication/domain/usecase/email_login.dart';
import 'package:wayve/features/authentication/domain/usecase/watch_auth_stream.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final EmailLoginUsecase _emailLoginUsecase;
  final WatchAuthStateUsecase _watchAuthStateUsecase;
  StreamSubscription<UserEntity?>? _authSubscription;

  AuthBloc({
    required EmailLoginUsecase emailLoginUsecase,
    required WatchAuthStateUsecase watchAuthStateUsecase,
  }) : _emailLoginUsecase = emailLoginUsecase,
       _watchAuthStateUsecase = watchAuthStateUsecase,
       super(AuthInitial()) {
    // 1. Listen for background auth changes
    on<AuthUserChanged>((event, emit) {
      if (event.user != null) {
        emit(AuthSuccess(userEntity: event.user!));
      } else {
        emit(AuthUnauthenticated());
      }
    });

    // 2. Handle manual login action
    on<EmailLoginRequested>((event, emit) async {
      emit(AuthLoading());
      final result = await _emailLoginUsecase.execute(
        email: event.email,
        password: event.password,
      );

      switch (result) {
        case Success(value: final user):
          emit(AuthSuccess(userEntity: user));
        case Error(failure: final failure):
          final msg = switch (failure) {
            ServerFailure(message: final m) => m,
            NetworkFailure(message: final m) => m,
          };
          emit(AuthFailure(message: msg));
      }
    });

    // 3. Initialize the stream listener
    _authSubscription = _watchAuthStateUsecase.execute().listen((user) {
      add(AuthUserChanged(user));
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
