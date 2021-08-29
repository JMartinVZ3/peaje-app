import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

class RegisterProfilePhoto extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: kSmallPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: kLargePadding,
                ),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: CustomSubtitle(text: 'Añade una foto de   perfil'),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 20,
                ),
                child: _DisplayPhoto(
                  controller: controller,
                )),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              'Tu rostro debe verse completamente',
              style: Get.theme.textTheme.bodyText2!.copyWith(
                fontSize: 14,
                color: PeajeColors.darkGrey,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 20,
                ),
                child: Obx(
                  () => YellowButton(
                    text: 'Siguiente',
                    onPressed: () async {
                      await controller.validateProfilePhoto();
                    },
                    active: controller.registerProfilePhotoButtonActive.value,
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}

class _DisplayPhoto extends StatelessWidget {
  final RegisterController controller;

  const _DisplayPhoto({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.profilePhotoState.value) {
        case PhotoState.NotLoaded:
          return GestureDetector(
            onTap: () {
              controller.selectPhotoProfile();
            },
            child: DottedBorder(
              strokeWidth: 3,
              strokeCap: StrokeCap.round,
              borderType: BorderType.Circle,
              dashPattern: [10, 10],
              color: PeajeColors.darkGrey,
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: PeajeColors.white100,
                  borderRadius: BorderRadius.circular(kBorderRadius * 100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: SvgPicture.asset(
                        'assets/icons/identifier_missing.svg',
                      ),
                    ),
                    Text(
                      'Imagen de tu rostro',
                      style: Get.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        color: PeajeColors.darkGrey,
                      ),
                    ),
                    Text(
                      'Evita gafas, gorra, etc..',
                      style: Get.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 12,
                        color: PeajeColors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        case PhotoState.Loading:
          return DottedBorder(
            strokeWidth: 3,
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            dashPattern: [10, 10],
            color: PeajeColors.darkGrey,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: PeajeColors.white100,
                borderRadius: BorderRadius.circular(kBorderRadius * 100),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: PeajeColors.darkGrey,
                  color: PeajeColors.grey,
                ),
              ),
            ),
          );
        case PhotoState.Loaded:
          return GestureDetector(
            onTap: () {
              controller.selectPhotoProfile();
            },
            child: Stack(
              children: [
                DottedBorder(
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                  borderType: BorderType.Circle,
                  color: PeajeColors.darkGrey,
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.file(controller.profilePhoto!).image,
                        fit: BoxFit.cover,
                      ),
                      color: PeajeColors.white100,
                      borderRadius: BorderRadius.circular(kBorderRadius * 100),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: () {
                      if (controller.profilePhoto != null) {
                        controller.registerProfilePhotoButtonActive.value =
                            false;
                        controller.profilePhotoState.value =
                            PhotoState.NotLoaded;
                        controller.profilePhoto!.delete();
                        controller.profilePhoto = null;
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: PeajeColors.red,
                        borderRadius: BorderRadius.circular(kBorderRadius * 10),
                      ),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

        default:
          return DottedBorder(
            strokeWidth: 3,
            strokeCap: StrokeCap.round,
            borderType: BorderType.Circle,
            dashPattern: [10, 10],
            color: PeajeColors.darkGrey,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: PeajeColors.white100,
                borderRadius: BorderRadius.circular(kBorderRadius * 100),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: PeajeColors.darkGrey,
                  color: PeajeColors.grey,
                ),
              ),
            ),
          );
      }
    });
  }
}
