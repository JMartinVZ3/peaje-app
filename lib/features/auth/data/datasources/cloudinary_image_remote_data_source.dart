import 'dart:developer';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:peaje_client/core/errors/exceptions.dart';

/// Esta es la clase abstracta para obtener fotos o subirlas a cloudinary
abstract class CloudinaryImageRemoteDataSource {
  /// Hace referencia a las credenciales de cloudinary
  final CloudinaryPublic cloudinary = CloudinaryPublic("fail", "geq0u7ec");

  /// Con esta funcion obtendremos la imagen de cloudinary
  Future<CloudinaryImage> getImage({required String imagePublicId});

  /// Esta funcion sube la imagen a cloudinary y retorna el publicId
  Future<String> uploadImage({required String imagePath});
}

/// Esta clase contiene las funciones para acceder a cloudinary
class CloudinaryImageRemoteDataSourceImpl
    extends CloudinaryImageRemoteDataSource {
  final CloudinaryPublic cloudinary = CloudinaryPublic("fail", "geq0u7ec");

  /// Esta funcion permite traer una imagen de cloduinary con el publicId con el que se guardo la foto
  @override
  Future<CloudinaryImage> getImage({required String imagePublicId}) async {
    return await cloudinary.getImage(imagePublicId);
  }

  /// Sirve para subir fotos a cloudinary desde la galeria del dispositivo y retorna el publicId
  /// con el que se guardo la foto
  @override
  Future<String> uploadImage({required String imagePath}) async {
    log('Running');
    try {
      final CloudinaryResponse response =
          await cloudinary.uploadFile(CloudinaryFile.fromFile(
        imagePath,
        resourceType: CloudinaryResourceType.Image,
      ));

      log(response.url);

      return response.publicId;
    } catch (e) {
      log('$e');
      throw ServerException();
    }
  }
}
