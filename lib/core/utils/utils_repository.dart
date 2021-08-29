import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/core/utils/utils.dart';

// ================================================================================================== //
//                                       Paleta de colores de la app                                  //
// ================================================================================================== //
/// Este es el color `azul` de la aplicación
Color get festiAzul => Get.theme.primaryColor;

/// Este es el color `amarillo` de la paleta de colores de la app
Color get festiAmarillo => Get.theme.accentColor;

/// Este es el color `beige` de la paleta de colores de la app
Color get festiBeige => Get.theme.colorScheme.primary;

/// Este es el color `gris` de la paleta de colores de la app
Color get festiGris => Get.theme.colorScheme.onPrimary;

/// Este es el color `background gris` de la paleta de colores de la app
Color get festiBackgroundGris => Get.theme.colorScheme.onError;

/// Este es el color `blanco` de la paleta de colores de la app
Color get festiBlanco => Get.theme.colorScheme.secondary;

/// Este es el color `naranja` de la paleta de colores de la app
Color get festiNaranja => Get.theme.colorScheme.onSecondary;

/// Este es el color `verde Claro` de la paleta de colores de la app
Color get festiVerdeClaro => Get.theme.colorScheme.surface;

/// Este es el color `verde Oscuro` de la paleta de colores de la app
Color get festiVerdeOscuro => Get.theme.colorScheme.onSurface;

/// Este es el color `rojo error` de la paleta de colores de la app
Color get festiRojoError => Get.theme.colorScheme.error;

/// Este es el color `gris w200` de la paleta de colores de la app
Color get festiGrisW200 => Get.theme.colorScheme.onBackground;

// ================================================================================================== //
//                                              Fuentes                                               //
// ================================================================================================== //

/// La fuente open Sansen con tamaño de `28dp`, para agregar propiedes usar `.copyWith()`
TextStyle get festiOpenSansHeadline1 => Get.theme.textTheme.headline1!;

/// La fuente open Sans con tamaño de `24dp`, para agregar propiedes usar `.copyWith()`
TextStyle get festiOpenSansHeadline2 => Get.theme.textTheme.headline2!;

/// La fuente open Sans con tamaño de `20dp` y bold, para agregar propiedes usar `.copyWith()`
TextStyle get festiOpenSansHeadline3 => Get.theme.textTheme.headline3!;

/// La fuente open Sans con tamaño de `20dp` y tipo de letra normal, para agregar propiedes usar `.copyWith()`
TextStyle get festiOpenSansHeadline4 => Get.theme.textTheme.headline4!;

/// La fuente open Sansen negrita, para agregar propiedes usar `.copyWith()`
TextStyle get festiOpenSansBold => Get.theme.textTheme.bodyText1!;

/// La fuente open Sans normal, para agregar propiedes usar `.copyWith()`
TextStyle get festiOpenSansNormal => Get.theme.textTheme.bodyText2!;

// ================================================================================================== //
//                                            Media Query                                             //
// ================================================================================================== //

/// Con esta funcion se obtiene la medida porcentual con la `altura` de la pantalla del dispositivo
///
/// Se utiliza una funcion afuera de la clase responsive para acceder a ella sin necesidad de escribir
/// todo el contenido de la clase
double mediaHeight(double percent) {
  /// Llamar esta funcion para obtener el alto del dispositivo
  return Responsive.of().hp(percent);
}

/// Con esta funcion se obtiene la medida porcentual con el `ancho` de la pantalla del dispositivo
///
/// Se utiliza una funcion afuera de la clase responsive para acceder a ella sin necesidad de escribir
/// todo el contenido de la clase
double mediaWidth(double percent) {
  /// Llamar esta funcion para obtener el ancho del dispositivo
  return Responsive.of().wp(percent);
}

/// Con esta funcion se obtiene la medida porcentual con la `diagonal` de la pantalla del dispositivo
///
/// Se utiliza una funcion afuera de la clase responsive para acceder a ella sin necesidad de escribir
/// todo el contenido de la clase
double mediaInch(double percent) {
  // Llamar esta funcion para obtener la diagonal del dispositivo
  /// Utilizar cuando no se quiera que cambie las medidas cuando gira el dispositivo
  return Responsive.of().ip(percent);
}

/// Con esta funcion verificamos si el valor que hemos introducido es numerico
bool isNumeric(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return (n == null) ? false : true;
}

/// Con esta funcion verificamos si el valor introducido es un correo valido
bool isValidEmail(String s) {
  return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(s);
}
