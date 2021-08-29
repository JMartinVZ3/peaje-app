import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';

class EditUser implements UseCase<bool, EditUserParams> {
  final UserRepository repository;

  EditUser(this.repository);

  @override
  Future<Either<Failure, bool>> call(EditUserParams params) async {
    return await repository.editUser(
      user: params.user,
    );
  }
}

class EditUserParams extends Equatable {
  final User user;

  EditUserParams({
    required this.user,
  });

  @override
  List<Object> get props => [
        user,
      ];

  @override
  bool get stringify => false;
}
