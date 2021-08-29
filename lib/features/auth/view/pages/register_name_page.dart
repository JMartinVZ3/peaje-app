import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

class RegisterNamePage extends GetView<RegisterController> {
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
              child: CustomSubtitle(text: 'Ingresa tu Nombre y Apellidos'),
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
                child: Form(
                  key: controller.formKeyName,
                  child: Column(
                    children: [
                      CustomInput(
                        placeholder: 'Nombres',
                        textController: controller.nameCtrl,
                        validationError: 'Ingresa tus nombres',
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      CustomInput(
                        placeholder: 'Apellidos',
                        textController: controller.lastNameCtrl,
                        validationError: 'Ingresa tus apellidos',
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                )),
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
                      controller.validateName();
                    },
                    active: controller.registerNameButtonActive.value,
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
