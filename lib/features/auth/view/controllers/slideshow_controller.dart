import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Este es el controlador de la pagina del slideshow
class SlideshowController extends GetxController {
  Rx<double> _currentPage = 0.0.obs;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage.value;

  set currentPage(double pagina) {
    this._currentPage.value = pagina;
    update();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double tamano) {
    this._bulletPrimario = tamano;
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double tamano) {
    this._bulletSecundario = tamano;
  }
}
