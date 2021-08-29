import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:peaje_client/core/errors/exceptions.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, User>> userIsLoggedIn() async {
    try {
      final remoteUser = await remoteDataSource.userIsLoggedIn();
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final remoteUser = await remoteDataSource.userLogin(
        email: email,
        password: password,
      );
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } on EmailException {
      return Left(EmailFailure());
    } on PasswordException {
      return Left(PasswordFailure());
    } on InactiveException {
      return Left(InactiveFailure());
    }
  }

  @override
  Future<Either<Failure, User>> userRegister({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String city,
    required File photo,
    required File identifier,
    required int identifierNumber,
  }) async {
    try {
      final remoteUser = await remoteDataSource.userRegister(
        email: email,
        password: password,
        name: name,
        lastName: lastName,
        city: city,
        photo: photo,
        identifier: identifier,
        identifierNumber: identifierNumber,
      );
      return Right(remoteUser);
    } on ServerException {
      return Left(ServerFailure());
    } on RegisterException {
      return Left(RegisterFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> editUser({required User user}) async {
    try {
      final remoteResponse = await remoteDataSource.editUser(user: user);
      return Right(remoteResponse);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> verifyEmail({
    required String email,
    required String confirmationCode,
  }) async {
    try {
      final remoteResponse = await remoteDataSource.verifyEmail(
        email: email,
        confirmationCode: confirmationCode,
      );
      return Right(remoteResponse);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> verifyIdentifier(
      {required String identifierNumber}) async {
    try {
      final remoteResponse = await remoteDataSource.verifyIdentifier(
          identifierNumber: identifierNumber);
      return Right(remoteResponse);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
