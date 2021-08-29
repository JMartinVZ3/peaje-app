import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';

class VerifyIdentifier implements UseCase<bool, VerifyIdentifierParams> {
  final UserRepository repository;

  VerifyIdentifier(this.repository);

  @override
  Future<Either<Failure, bool>> call(VerifyIdentifierParams params) async {
    return await repository.verifyIdentifier(
      identifierNumber: params.identifierNumber,
    );
  }
}

class VerifyIdentifierParams extends Equatable {
  final String identifierNumber;

  VerifyIdentifierParams({
    required this.identifierNumber,
  });

  @override
  List<Object> get props => [
        identifierNumber,
      ];

  @override
  bool get stringify => false;
}
