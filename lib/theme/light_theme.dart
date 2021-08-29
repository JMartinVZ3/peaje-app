import 'package:flutter/material.dart';
import 'package:peaje_client/common.dart';

/// Este tema es el tema light de la aplicación, aqui
/// se agregaran todos los colores y fuentes para poder
/// cambiar mas facilmente el tema
///
/// Aqui se van a encontrar todos los colores que utiliza la app
final ThemeData lightTheme = ThemeData(
  primaryColor: PeajeColors.white,
  accentColor: PeajeColors.yellow,
  fontFamily: 'Open Sans',
  textTheme: TextTheme(
    headline1: PeajeFonts.headline1,
    headline2: PeajeFonts.headline2,
    headline3: PeajeFonts.headline3,
    headline4: PeajeFonts.headline4,
    bodyText1: PeajeFonts.openSansBold,
    bodyText2: PeajeFonts.openSansNormal,
  ),
);
