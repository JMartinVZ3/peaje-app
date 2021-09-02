import 'dart:async';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

/// Controlador de la ubicacion
class LocationController extends GetxController {
  /// Variable que define si la localizacion ha sido escogida
  final Rx<bool> locationChosen = false.obs;

  /// Variable que define si estamos siguiendo al usuario
  final Rx<bool> following = false.obs;

  /// Variable que nos muestra si la ubicacion existe
  final Rx<bool> locationExists = false.obs;

  /// Variable que contiene la ubicacion del usuario
  late Rx<LatLng> location = LatLng(0, 0).obs;

  /// Geolocator
  late StreamSubscription<Position> _positionSubscription;

  /// Funcion que inicia el seguimiento
  void startFollowing() {
    _positionSubscription = Geolocator.getPositionStream(
            desiredAccuracy: LocationAccuracy.high, distanceFilter: 10)
        .listen((Position position) {
      final LatLng newLocation =
          new LatLng(position.latitude, position.longitude);
      locationExists.value = true;
      location.value = newLocation;
    });
  }

  /// Esta funcion cancela el seguimiento
  void stopFollowing() {
    _positionSubscription.cancel();
  }

  /// Esta funcion cambia la ubicacion
  void onLocationChanged(LatLng newLocation) {
    locationExists.value = true;
    location.value = newLocation;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    stopFollowing();
    super.onClose();
  }
}
