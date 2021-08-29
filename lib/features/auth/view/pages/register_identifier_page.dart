import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

class RegisterIdentifierPage extends GetView<RegisterController> {
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
                child: CustomSubtitle(text: 'Ingresa tu cédula')),
            Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 20,
                ),
                child: Form(
                  key: controller.formKeyIdentifier,
                  child: CustomInput(
                    placeholder: 'Número de Cédula',
                    validationError:
                        'Debes introducir un número de cédula válido',
                    keyboardType: TextInputType.datetime,
                    textController: controller.identifierCtrl,
                    isIdentifier: true,
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Divider(
                thickness: 3,
              ),
            ),
            _DisplayAddIdentifier(
              controller: controller,
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
                    onPressed: () {
                      controller.validateIdentifier();
                    },
                    active: controller.registerIdentifierButtonActive.value,
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}

class _DisplayAddIdentifier extends StatelessWidget {
  final RegisterController controller;

  const _DisplayAddIdentifier({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Obx(() {
          switch (controller.identifierPhotoState.value) {
            case PhotoState.NotLoaded:
              return GestureDetector(
                onTap: () {
                  controller.selectPhotoIdentifier();
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10, right: 10),
                  child: DottedBorder(
                    radius: Radius.circular(kBorderRadius),
                    borderType: BorderType.RRect,
                    dashPattern: [1, 0, 6],
                    color: Colors.black,
                    child: Container(
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadius),
                        color: PeajeColors.white100,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: SvgPicture.asset(
                                'assets/icons/identifier_missing.svg',
                              ),
                            ),
                            Text(
                              'Imagen de tu cédula',
                              style: Get.theme.textTheme.bodyText2!
                                  .copyWith(fontSize: 14),
                            ),
                            Text(
                              '1280 x 720px',
                              style: Get.theme.textTheme.bodyText2!.copyWith(
                                  fontSize: 12, color: PeajeColors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            case PhotoState.Loading:
              return Padding(
                padding: EdgeInsets.only(top: 10, right: 10),
                child: DottedBorder(
                  radius: Radius.circular(kBorderRadius),
                  borderType: BorderType.RRect,
                  dashPattern: [1, 0, 6],
                  color: Colors.black,
                  child: Container(
                    height: 145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: PeajeColors.white100,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: PeajeColors.darkGrey,
                        color: PeajeColors.grey,
                      ),
                    ),
                  ),
                ),
              );

            case PhotoState.Loaded:
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.selectPhotoIdentifier();
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: DottedBorder(
                                radius: Radius.circular(kBorderRadius),
                                borderType: BorderType.RRect,
                                dashPattern: [1, 0, 6],
                                color: Colors.black,
                                child: Container(
                                  height: 145,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kBorderRadius),
                                    color: PeajeColors.white100,
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          child: SvgPicture.asset(
                                            'assets/icons/identifier_complete.svg',
                                          ),
                                        ),
                                        Text(
                                          '${controller.identifierPhoto!.path.split('/').last}',
                                          style: Get.theme.textTheme.bodyText2!
                                              .copyWith(fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '1280 x 720px',
                                          style: Get.theme.textTheme.bodyText2!
                                              .copyWith(
                                                  fontSize: 12,
                                                  color: PeajeColors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (controller.identifierPhoto != null) {
                                controller.registerIdentifierButtonActive
                                    .value = false;
                                controller.identifierPhotoState.value =
                                    PhotoState.NotLoaded;
                                controller.identifierPhoto!.delete();
                                controller.identifierPhoto = null;
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: PeajeColors.red,
                                borderRadius:
                                    BorderRadius.circular(kBorderRadius * 10),
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
                  )
                ],
              );

            default:
              return Padding(
                padding: EdgeInsets.only(top: 10, right: 10),
                child: DottedBorder(
                  radius: Radius.circular(kBorderRadius),
                  borderType: BorderType.RRect,
                  dashPattern: [1, 0, 6],
                  color: Colors.black,
                  child: Container(
                    height: 145,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius),
                      color: PeajeColors.white100,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: PeajeColors.darkGrey,
                        color: PeajeColors.grey,
                      ),
                    ),
                  ),
                ),
              );
          }
        }));
  }
}
