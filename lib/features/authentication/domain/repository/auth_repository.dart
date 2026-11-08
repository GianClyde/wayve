import 'package:wayve/core/errors/failure.dart';
import 'package:wayve/core/errors/results.dart';
import 'package:wayve/features/authentication/domain/entity/user.dart';

abstract interface class AuthRepository {
  Stream<UserEntity?> get authStateStream;
  UserEntity? get currentUser;
  Future<Result<UserEntity, Failure>> emailLogin({
    required String email,
    required String password,
  });
  Future<void> signOut();
}
