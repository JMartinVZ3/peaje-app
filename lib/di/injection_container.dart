import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:peaje_client/features/auth/data/datasources/cloudinary_image_remote_data_source.dart';
import 'package:peaje_client/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:peaje_client/features/auth/data/repositories/cloudinary_image_repository_impl.dart';
import 'package:peaje_client/features/auth/data/repositories/user_repository_impl.dart';
import 'package:peaje_client/features/auth/domain/repositories/cloudinary_image_repository.dart';
import 'package:peaje_client/features/auth/domain/repositories/user_repository.dart';
import 'package:peaje_client/features/auth/domain/usecases/edit_user.dart';
import 'package:peaje_client/features/auth/domain/usecases/get_image.dart';
import 'package:peaje_client/features/auth/domain/usecases/upload_image.dart';
import 'package:peaje_client/features/auth/domain/usecases/user_is_logged_in.dart';
import 'package:peaje_client/features/auth/domain/usecases/user_login.dart';
import 'package:peaje_client/features/auth/domain/usecases/user_register.dart';
import 'package:peaje_client/features/auth/domain/usecases/verify_email.dart';
import 'package:peaje_client/features/auth/domain/usecases/verify_identifier.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Use cases
  //* Users
  sl.registerLazySingleton(() => UserIsLoggedIn(sl()));
  sl.registerLazySingleton(() => UserLogin(sl()));
  sl.registerLazySingleton(() => UserRegister(sl()));
  sl.registerLazySingleton(() => EditUser(sl()));
  sl.registerLazySingleton(() => VerifyEmail(sl()));
  sl.registerLazySingleton(() => VerifyIdentifier(sl()));

  //* Cloudinary
  sl.registerLazySingleton(() => GetImage(sl()));
  sl.registerLazySingleton(() => UploadImage(sl()));

  //! Repository
  //* Users
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: sl()));

  //* Cloudinary
  sl.registerLazySingleton<CloudinaryImageRepository>(
      () => CloudinaryImageRepositoryImpl(remoteDataSource: sl()));

  //! Data Sources
  //* Users
  sl.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));

  //* Cloudinary
  sl.registerLazySingleton<CloudinaryImageRemoteDataSource>(
      () => CloudinaryImageRemoteDataSourceImpl());

  //! External
  sl.registerLazySingleton<http.Client>(() => http.Client());
}
