import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

/// Esta clase se encarga de hacer los procesos del mediaQuery de manera mas rápida
class Responsive {
  /// Se incerta width, height o inch para hacer los respectivos calculos
  final double width, height, inch;

  /// constructor de la clase para poder pasar los parámetros
  Responsive({required this.width, required this.height, required this.inch});

  /// Se utiliza el metodo of para tomar el contexto
  factory Responsive.of() {
    final MediaQueryData data = MediaQuery.of(Get.context!);
    final Size size = data.size;
    final double inch =
        math.sqrt((math.pow(size.height, 2) + math.pow(size.width, 2)));
    return Responsive(width: size.width, height: size.height, inch: inch);
  }

  /// funcion para pasar el porcentaje del width y sacar el mediaQuery
  /// de acuerdo a la anchura de la pantalla
  double wp(double porcent) {
    return this.width * porcent;
  }

  /// funcion para pasar el porcentaje del height
  /// y sacar la medida de acuerdo a la altura de la pantalla
  double hp(double porcent) {
    return this.height * porcent;
  }

  /// funcion para pasar el porcentaje del inch y
  /// sacar el mediaQuery de la diagonal de la pantalla
  double ip(double porcent) {
    return this.inch * porcent;
  }
}
