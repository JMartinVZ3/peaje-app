import 'package:dartz/dartz.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';

class UserIsLoggedIn implements UseCase<User, NoParams> {
  final UserRepository repository;

  UserIsLoggedIn(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await repository.userIsLoggedIn();
  }
}
