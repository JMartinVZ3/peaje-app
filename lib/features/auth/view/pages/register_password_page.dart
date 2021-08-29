import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

class RegisterPasswordPage extends GetView<RegisterController> {
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
              child: CustomSubtitle(text: 'Ingresa una   contraseña'),
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
                  key: controller.formKeyPassword,
                  child: Column(
                    children: [
                      Obx(
                        () => CustomInput(
                          placeholder: 'Contraseña',
                          textController: controller.passwordCtrl,
                          validationError: 'Ingresa tu contraseña',
                          keyboardType: TextInputType.name,
                          isPassword: true,
                          isConfirmationPassword:
                              controller.isConfirmationPasswordCorrect.value,
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding / 2,
                      ),
                      Obx(
                        () => CustomInput(
                          placeholder: 'Repite la contraseña',
                          textController: controller.passwordConfirmationCtrl,
                          validationError: 'Tu constraseña debe ser igual',
                          keyboardType: TextInputType.name,
                          isPassword: true,
                          isConfirmationPassword:
                              controller.isConfirmationPasswordCorrect.value,
                        ),
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
                    onPressed: () async {
                      await controller.validatePassword();
                    },
                    active: controller.registerPasswordButtonActive.value,
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
