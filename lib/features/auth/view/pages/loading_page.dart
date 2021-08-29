import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/colors.dart';
import 'package:peaje_client/features/auth/view/controllers/loading_controller.dart';

/// Pagina en la que se verifica si el usuario ha iniciado sesion.
class LoadingPage extends GetView<LoadingController> {
  @override
  Widget build(BuildContext context) {
    final controlador = controller;
    return Scaffold(
        body: Container(
      color: PeajeColors.black,
      child: Center(
        child: CircularProgressIndicator(
          color: PeajeColors.yellow,
        ),
      ),
    ));
  }
}
