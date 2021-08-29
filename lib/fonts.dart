import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/// Contiene las fuentes de texto que vayamos a utilizar
class PeajeFonts {
  /// Open Sans Bold se usa para textos primarios
  static TextStyle headline1 = GoogleFonts.openSans(
      fontWeight: FontWeight.bold, fontSize: 28, color: PeajeColors.black);

  /// Open Sans Bold se usa para textos primarios
  static TextStyle headline2 = GoogleFonts.openSans(
      fontWeight: FontWeight.bold, fontSize: 24, color: PeajeColors.black);

  /// Open Sans Bold se usa para textos primarios
  static TextStyle headline3 = GoogleFonts.openSans(
      fontWeight: FontWeight.bold, fontSize: 20, color: PeajeColors.black);

  /// Open Sans Bold se usa para textos primarios
  static TextStyle headline4 = GoogleFonts.openSans(
      fontWeight: FontWeight.normal, fontSize: 20, color: PeajeColors.black);

  /// Open Sans Bold se usa para textos primarios
  static TextStyle openSansBold = GoogleFonts.openSans(
      fontWeight: FontWeight.bold, fontSize: 18, color: PeajeColors.black);

  /// Open Sans Normal se usa para textos secundarios
  static TextStyle openSansNormal = GoogleFonts.openSans(
      fontWeight: FontWeight.normal, fontSize: 18, color: PeajeColors.black);
}
