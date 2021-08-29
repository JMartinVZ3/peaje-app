import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PageState {
  Start,
  Account,
}

/// Controlador de la pagina de inicio
class HomeController extends GetxController {
  Rx<PageState> pageState = PageState.Start.obs;

  Rx<int> paginaActual = 0.obs;

  Rx<PageController> pageController = new PageController().obs;
}
