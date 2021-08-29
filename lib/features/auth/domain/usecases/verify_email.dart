import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';

class VerifyEmail implements UseCase<bool, VerifyEmailParams> {
  final UserRepository repository;

  VerifyEmail(this.repository);

  @override
  Future<Either<Failure, bool>> call(VerifyEmailParams params) async {
    return await repository.verifyEmail(
      email: params.email,
      confirmationCode: params.confirmationCode,
    );
  }
}

class VerifyEmailParams extends Equatable {
  final String email;
  final String confirmationCode;

  VerifyEmailParams({
    required this.email,
    required this.confirmationCode,
  });

  @override
  List<Object> get props => [
        email,
        confirmationCode,
      ];

  @override
  bool get stringify => false;
}
