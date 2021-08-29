import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/features/auth/view/controllers/login_controller.dart';
import 'package:peaje_client/features/auth/view/widgets/widgets.dart';

/// Pagina en la que se verifica si el usuario ha iniciado sesion.
class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PeajeColors.darkGrey,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(height: MediaQuery.of(context).size.height * 0.2),
                Container(
                    height: MediaQuery.of(context).size.height / 1.25,
                    decoration: BoxDecoration(
                        color: PeajeColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kBorderRadius * 3),
                          topRight: Radius.circular(kBorderRadius * 3),
                        )),
                    child: LoginForm(
                      controller: controller,
                    ))
              ],
            ),
          ),
        ));
  }
}
