import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final UserRepository repository;

  UserLogin(this.repository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await repository.userLogin(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams extends Equatable {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        email,
        password,
      ];

  @override
  bool get stringify => false;
}
