import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> userIsLoggedIn();
  Future<Either<Failure, User>> userLogin({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> userRegister({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String city,
    required File photo,
    required File identifier,
    required int identifierNumber,
  });
  Future<Either<Failure, bool>> editUser({
    required User user,
  });
  Future<Either<Failure, bool>> verifyEmail({
    required String email,
    required String confirmationCode,
  });
  Future<Either<Failure, bool>> verifyIdentifier({
    required String identifierNumber,
  });
}
