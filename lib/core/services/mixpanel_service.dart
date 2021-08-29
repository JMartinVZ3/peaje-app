import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';

/// Clase reutilizable para manejar kpi's con mixpanel
class MixpanelService extends GetxController {
  /// Implementacion de mixpanel
  late final Mixpanel mixpanel;

  /// Esta funcion inicializa Mixpanel
  Future<void> initMixpanel() async {
    mixpanel = await Mixpanel.init(
      "61cb12dc6c626e1a0be74cbdb4a412cc",
      optOutTrackingDefault: false,
    );
  }

  /// Track with event-name
  void restaurantLoggedIn() {
    mixpanel.track('Iniciar sesión restaurante');
  }

  /// Track with event-name
  void restaurantClickedRegister() {
    mixpanel.track('Crear cuenta restaurante',
        properties: <String, String>{'estado': 'comenzado'});
  }

  /// Track with event-name
  void restaurantFinishedRegister() {
    mixpanel.track('Crear cuenta restaurante',
        properties: <String, String>{'estado': 'terminado'});
  }

  /// Track with event-name
  void waiterLoggedIn() {
    mixpanel.track('Iniciar sesión mesero');
  }

  /// Track with event-name
  void waiterClickedRegister() {
    mixpanel.track('Crear cuenta mesero',
        properties: <String, String>{'estado': 'comenzado'});
  }

  /// Track with event-name
  void waiterFinishedRegister() {
    mixpanel.track('Crear cuenta mesero',
        properties: <String, String>{'estado': 'terminado'});
  }

  /// Track with event-name
  void restaurantPostTable() {
    mixpanel.track("Restaurante crear mesa");
  }

  /// Track with event-name
  void restaurantPostCategory() {
    mixpanel.track("Restaurante crear categoria");
  }

  /// Track with event-name
  void restaurantPostProduct() {
    mixpanel.track("Restaurante crear producto");
  }

  /// Track with event-name
  void restaurantOrderAccepted() {
    mixpanel.track("Restaurante orden aceptada");
  }

  /// Track with event-name
  void restaurantOrderCancelled() {
    mixpanel.track("Restaurante orden cancelada");
  }

  /// Track with event-name
  void restaurantTableDeactivated() {
    mixpanel.track("Restaurante mesa desactivada");
  }

  /// Track with event-name
  void restaurantQrCodeDownloaded() {
    mixpanel.track("Restaurante descargado codigo qr");
  }

  /// Track with event-name
  void waiterOrderAccepted() {
    mixpanel.track("Mesero orden aceptada");
  }

  /// Track with event-name
  void waiterOrderCancelled() {
    mixpanel.track("Mesero orden cancelada");
  }

  /// Track with event-name
  void waiterTableDeactivated() {
    mixpanel.track("Mesero mesa desactivada");
  }

  /// Track with event-name
  void waiterQrCodeDownloaded() {
    mixpanel.track("Mesero descargado codigo qr");
  }

  @override
  onInit() async {
    mixpanel = await Mixpanel.init(
      "61cb12dc6c626e1a0be74cbdb4a412cc",
      optOutTrackingDefault: false,
    );
    log("Mixpanel has been initialized");
    super.onInit();
  }
}
