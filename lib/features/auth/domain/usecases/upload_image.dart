import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/repositories/cloudinary_image_repository.dart';

class UploadImage implements UseCase<String, UploadImageParams> {
  final CloudinaryImageRepository repository;

  UploadImage(this.repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) async {
    return await repository.uploadImage(
      imagePath: params.imagePath,
    );
  }
}

class UploadImageParams extends Equatable {
  final String imagePath;

  UploadImageParams({
    required this.imagePath,
  });

  @override
  List<Object> get props => [
        imagePath,
      ];

  @override
  bool get stringify => false;
}
