import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Controlador del mapa
class MapController extends GetxController {
  /// Variable reactiva que define si el mapa esta listo
  final Rx<bool> mapReady = false.obs;

  /// Variable reactiva que define si debemos seguir la ubicacion del usuario
  final Rx<bool> followLocation = false.obs;

  /// Variable que contiene la ubicacion central en el mapa
  late final Rx<LatLng> centralLocation = LatLng(0, 0).obs;

  // Controlador del mapa
  late GoogleMapController _mapController;

  void initMapa(GoogleMapController controller) {
    if (!mapReady.value) {
      this._mapController = controller;

      this.mapReady.value = true;
    }
  }

  void moveMap(LatLng centralMap) {
    this.centralLocation.value = centralMap;
  }

  void moveCamera(LatLng destiny) {
    final cameraUpdate = CameraUpdate.newLatLng(destiny);
    this._mapController.animateCamera(cameraUpdate);
  }

  void onNewLocation(LatLng location) {
    if (followLocation.value) {
      moveCamera(location);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
