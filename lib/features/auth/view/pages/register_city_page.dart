import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

class RegisterCityPage extends GetView<RegisterController> {
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
              child: CustomSubtitle(text: 'Ingresa tu ciudad de residencia'),
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
                key: controller.formKeyCity,
                child: CustomInput(
                  placeholder: 'Ciudad',
                  textController: controller.cityCtrl,
                  validationError: 'Ingresa la ciudad',
                  keyboardType: TextInputType.name,
                ),
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
                    onPressed: () {
                      controller.validateCity();
                    },
                    active: controller.registerCityButtonActive.value,
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
