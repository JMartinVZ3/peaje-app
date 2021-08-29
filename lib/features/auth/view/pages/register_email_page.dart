import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

/// Pagina en la que se verifica si el usuario ha iniciado sesion.
class RegisterEmailPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: kSmallPadding),
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
              child: CustomSubtitle(text: 'Ingresa tu correo')),
          Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 20,
                top: 20,
              ),
              child: Form(
                key: controller.formKeyEmail,
                child: CustomInput(
                  isEmail: true,
                  placeholder: 'Correo Electrónico',
                  validationError: 'Debes introducir un correo válido',
                  keyboardType: TextInputType.emailAddress,
                  textController: controller.emailCtrl,
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
                    controller.validateEmail();
                  },
                  active: controller.registerEmailButtonActive.value,
                ),
              )),
          Spacer(),
          Text('Ya tienes una cuenta? Inicia Sesión'),
          SizedBox(
            height: kVerticalPadding,
          ),
        ],
      ),
    ));
  }
}
