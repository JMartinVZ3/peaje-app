import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';

class UserRegister implements UseCase<User, UserRegisterParams> {
  final UserRepository repository;

  UserRegister(this.repository);

  @override
  Future<Either<Failure, User>> call(UserRegisterParams params) async {
    return await repository.userRegister(
      email: params.email,
      password: params.password,
      name: params.name,
      lastName: params.lastName,
      city: params.city,
      photo: params.photo,
      identifier: params.identifier,
      identifierNumber: params.identifierNumber,
    );
  }
}

class UserRegisterParams extends Equatable {
  final String email;
  final String password;
  final String name;
  final String lastName;
  final String city;
  final File photo;
  final File identifier;
  final int identifierNumber;

  UserRegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
    required this.city,
    required this.photo,
    required this.identifier,
    required this.identifierNumber,
  });

  @override
  List<Object> get props => [
        email,
        password,
        name,
        lastName,
        city,
        photo,
        identifier,
        identifierNumber,
      ];

  @override
  bool get stringify => false;
}
