import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:wayve/core/errors/failure.dart';
import 'package:wayve/core/errors/results.dart';
import 'package:wayve/features/authentication/data/datasource/remote/remote_datasource.dart';
import 'package:wayve/features/authentication/domain/entity/user.dart';
import 'package:wayve/features/authentication/domain/repository/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final RemoteDatasource _remoteDatasource;

  AuthRepositoryImpl({required RemoteDatasource remoteDatasource})
    : _remoteDatasource = remoteDatasource;

  @override
  Stream<UserEntity?> get authStateStream {
    return _remoteDatasource.authStateChanges.map((data) {
      final user = data.session?.user;
      if (user == null) return null;
      return UserEntity(id: user.id, email: user.email ?? '');
    });
  }

  @override
  UserEntity? get currentUser {
    final user = _remoteDatasource.currentUser;
    if (user == null) return null;
    return UserEntity(id: user.id, email: user.email ?? '');
  }

  @override
  Future<Result<UserEntity, Failure>> emailLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remoteDatasource.emailLogin(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        return Error(ServerFailure('User not found'));
      }
      return Success(UserEntity(id: user.id, email: user.email ?? ''));
    } on AuthException catch (e) {
      return Error(ServerFailure(e.message));
    } catch (e) {
      return Error(NetworkFailure(e.toString()));
    }
  }

  @override
  Future<void> signOut() async => await _remoteDatasource.signOut();
}
