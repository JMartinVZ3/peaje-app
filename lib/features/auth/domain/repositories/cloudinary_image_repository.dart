import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dartz/dartz.dart';
import 'package:peaje_client/core/errors/failure.dart';

abstract class CloudinaryImageRepository {
  /// Esta funcion trae una imagen de cloudinary con el publicId
  /// El `publicId` es el uid que se genera cuando se sube la imagen
  Future<Either<Failure, CloudinaryImage>> getImage({
    required String imagePublicId,
  });

  /// Esta funcion sube una imagen a cloudinary y retorna el publicId
  /// con el que luego se va a poder pedir la imagen
  Future<Either<Failure, String>> uploadImage({
    required String imagePath,
  });
}
