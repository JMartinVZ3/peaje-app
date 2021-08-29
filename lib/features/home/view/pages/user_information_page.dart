import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/view/controllers/user_controller.dart';

class UserInformationPage extends StatelessWidget {
  const UserInformationPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    /// Importamos el controlador que contiene el usuario
    final UserController userController = Get.find<UserController>();
    final User user = userController.user;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PeajeColors.darkGrey,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: kiconSize / 1.5,
            color: PeajeColors.white,
          ),
        ),
        title: Text(
          'Datos',
          style: Get.textTheme.headline2!.copyWith(
            color: PeajeColors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: PeajeColors.darkGrey,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "Nombre y Apellidos",
              style: Get.textTheme.bodyText1!.copyWith(
                color: PeajeColors.white,
              ),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              "${user.name} ${user.lastName}",
              style: Get.textTheme.bodyText2!.copyWith(
                color: PeajeColors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Text(
              "Correo Electrónico",
              style: Get.textTheme.bodyText1!.copyWith(
                color: PeajeColors.white,
              ),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              "${user.email}",
              style: Get.textTheme.bodyText2!.copyWith(
                color: PeajeColors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
