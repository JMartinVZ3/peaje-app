import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/usecases/usecase.dart';
import 'package:peaje_client/features/auth/domain/repositories/cloudinary_image_repository.dart';

class GetImage implements UseCase<CloudinaryImage, GetImageParams> {
  final CloudinaryImageRepository repository;

  GetImage(this.repository);

  @override
  Future<Either<Failure, CloudinaryImage>> call(GetImageParams params) async {
    return await repository.getImage(
      imagePublicId: params.imagePublicId,
    );
  }
}

class GetImageParams extends Equatable {
  final String imagePublicId;

  GetImageParams({
    required this.imagePublicId,
  });

  @override
  List<Object> get props => [
        imagePublicId,
      ];

  @override
  bool get stringify => false;
}
