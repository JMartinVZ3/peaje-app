import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:peaje_client/core/errors/exceptions.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/global/environment.dart';
import 'package:peaje_client/core/services/auth_service.dart';
import 'package:peaje_client/di/injection_container.dart';
import 'package:peaje_client/features/auth/data/models/login_response.dart';
import 'package:peaje_client/features/auth/data/models/user_model.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/usecases/get_image.dart';
import 'package:peaje_client/features/auth/domain/usecases/upload_image.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> userIsLoggedIn();

  Future<UserModel> userLogin({
    required String email,
    required String password,
  });

  Future<UserModel> userRegister({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String city,
    required File photo,
    required File identifier,
    required int identifierNumber,
  });

  Future<bool> editUser({
    required User user,
  });

  Future<bool> verifyEmail({
    required String email,
    required String confirmationCode,
  });

  Future<bool> verifyIdentifier({
    required String identifierNumber,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl({required this.client});
  final _storage = new FlutterSecureStorage();
  final http.Client client;
  final uri = Environment.apiUrl;

  final GetImage getImage = sl<GetImage>();

  final UploadImage uploadImage = sl<UploadImage>();

  @override
  Future<UserModel> userIsLoggedIn() async {
    final endPoint = Uri.https(uri, 'api/v1/login/renew');

    final String? token = await AuthService.getToken();

    if (token == null) {
      throw ServerException();
    }

    final response = await http.get(endPoint, headers: {
      'Content-Type': 'application/json',
      'x-token': token,
    });

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await this._guardarToken(loginResponse.token);
      return loginResponse.user;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> userLogin({
    required String email,
    required String password,
  }) async {
    final endPoint = Uri.https(uri, 'api/v1/login');

    final Map<String, String> data = <String, String>{
      'email': email,
      'password': password,
    };

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await this._guardarToken(loginResponse.token);
      return loginResponse.user;
    } else if (response.statusCode == 404) {
      throw EmailException();
    } else if (response.statusCode == 400) {
      throw PasswordException();
    } else if (response.statusCode == 401) {
      throw InactiveException();
    }
    {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> userRegister({
    required String email,
    required String password,
    required String name,
    required String lastName,
    required String city,
    required File photo,
    required File identifier,
    required int identifierNumber,
  }) async {
    final endPoint = Uri.https(uri, '/api/v1/login/new');
    final String? photoUrl = await uploadAndGetImageUrl(imagePath: photo.path);

    final String? identifierUrl =
        await uploadAndGetImageUrl(imagePath: identifier.path);

    if (photoUrl != null && identifierUrl != null) {
      final data = {
        'email': email,
        'password': password,
        'name': name,
        'lastName': lastName,
        'city': city,
        'photoUrl': photoUrl,
        'identifierUrl': identifierUrl,
        'identifierNumber': identifierNumber,
      };

      final response = await http.post(endPoint,
          body: jsonEncode(data),
          headers: {'Content-Type': 'application/json'});

      print(response.body);

      if (response.statusCode == 200) {
        final loginResponse = loginResponseFromJson(response.body);
        await this._guardarToken(loginResponse.token);
        return loginResponse.user;
      } else if (response.statusCode == 400) {
        throw RegisterException();
      } else {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> editUser({required User user}) async {
    final endPoint = Uri.https(uri, '/api/users/${user.uid}');

    final String? token = await AuthService.getToken();

    if (token == null) {
      throw ServerException();
    }

    final response = await http.put(endPoint, body: jsonEncode(user), headers: {
      'Content-Type': 'application/json',
      'x-token': token,
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  @override
  Future<bool> verifyEmail({
    required String email,
    required String confirmationCode,
  }) async {
    final endPoint = Uri.https(uri, '/api/v1/login/verify/email');

    final Map<String, String> data = <String, String>{
      'email': email,
      'confirmationCode': confirmationCode,
    };

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> verifyIdentifier({
    required String identifierNumber,
  }) async {
    final endPoint = Uri.https(uri, '/api/v1/login/verify/identifier');

    final Map<String, String> data = <String, String>{
      'identifierNumber': identifierNumber
    };

    final response =
        await http.post(endPoint, body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException();
    }
  }

  /// Esta funcion sube una imagen a cloudinary y retorna
  /// una url de la imagen subida
  Future<String?> uploadAndGetImageUrl({
    required String imagePath,
  }) async {
    print('Running...');
    final Either<Failure, String> imagePublicResponse =
        await uploadImage.call(UploadImageParams(imagePath: imagePath));

    return imagePublicResponse.fold((failure) {
      print('Error 1');
      return null;
    }, (data) async {
      final Either<Failure, CloudinaryImage> cloudinaryImageResponse =
          await getImage.call(GetImageParams(imagePublicId: data));

      return cloudinaryImageResponse.fold(
        (failure) {
          print('Error 2');
          return null;
        },
        (data) {
          final imageUrl = data.url;

          return imageUrl;
        },
      );
    });
  }
}
