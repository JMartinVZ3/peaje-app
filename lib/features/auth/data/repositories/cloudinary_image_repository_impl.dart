import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:peaje_client/core/errors/exceptions.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:peaje_client/features/auth/data/datasources/cloudinary_image_remote_data_source.dart';
import 'package:peaje_client/features/auth/domain/repositories/cloudinary_image_repository.dart';

class CloudinaryImageRepositoryImpl implements CloudinaryImageRepository {
  final CloudinaryImageRemoteDataSource remoteDataSource;

  CloudinaryImageRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, CloudinaryImage>> getImage({
    required String imagePublicId,
  }) async {
    try {
      final CloudinaryImage cloudinaryImage =
          await CloudinaryImageRemoteDataSourceImpl()
              .getImage(imagePublicId: imagePublicId);
      return Right(cloudinaryImage);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(
      {required String imagePath}) async {
    try {
      final String publicId = await CloudinaryImageRemoteDataSourceImpl()
          .uploadImage(imagePath: imagePath);
      return Right(publicId);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }
}
