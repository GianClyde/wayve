import 'package:injectable/injectable.dart';
import 'package:wayve/core/errors/failure.dart';
import 'package:wayve/core/errors/results.dart';
import 'package:wayve/features/authentication/domain/entity/user.dart';
import 'package:wayve/features/authentication/domain/repository/auth_repository.dart';

@injectable
class EmailLoginUsecase {
  final AuthRepository _authRepository;
  const EmailLoginUsecase({required this._authRepository});

  Future<Result<UserEntity, Failure>> execute({
    required String email,
    required String password,
  }) async =>
      await _authRepository.emailLogin(email: email, password: password);
}
