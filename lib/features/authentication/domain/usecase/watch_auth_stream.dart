import 'package:injectable/injectable.dart';
import 'package:wayve/features/authentication/domain/entity/user.dart';
import 'package:wayve/features/authentication/domain/repository/auth_repository.dart';

@lazySingleton
class WatchAuthStateUsecase {
  final AuthRepository _repository;

  WatchAuthStateUsecase(this._repository);

  Stream<UserEntity?> execute() => _repository.authStateStream;
  UserEntity? get currentUser => _repository.currentUser;
}
