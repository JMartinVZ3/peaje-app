import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

class RegisterEmailConfirmationPage extends GetView<RegisterController> {
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
              child: CustomSubtitle(text: 'Ingresa el código de confirmación'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ingresa el código de confirmación que enviamos a tu correo. Volver a enviar código de confirmación',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 20,
                ),
                child: Form(
                  key: controller.formKeyEmailConfirmation,
                  child: Obx(
                    () => CustomInput(
                      placeholder: 'Código de Confirmación',
                      textController: controller.emailConfirmationCtrl,
                      validationError: 'Ingresa el código de confirmación',
                      keyboardType: TextInputType.datetime,
                      isNumericValue: true,
                      isConfirmationMail:
                          controller.isConfirmationCodeCorrect.value,
                    ),
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
                      controller.validateEmailConfirmation();
                    },
                    active:
                        controller.registerEmailConfirmationButtonActive.value,
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
