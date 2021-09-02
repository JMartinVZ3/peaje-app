import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peaje_client/features/home/view/controllers/location_controller.dart';
import 'package:peaje_client/features/home/view/controllers/map_controller.dart';
import 'package:peaje_client/features/home/view/widgets/widgets.dart';

class MarkLocationPage extends StatelessWidget {
  /// Importamos el controlador de la ubicacion
  final LocationController locationController = Get.put(LocationController());

  /// Importamos el controlador del mapa
  final MapController mapController = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[Obx(() => createMap()), MapMarker()]),
    );
  }

  /// Esta funcion crea el mapa
  Widget createMap() {
    if (!locationController.locationExists.value)
      return Center(child: Text('Ubicando...'));

    mapController.onNewLocation(locationController.location.value);

    final CameraPosition cameraPosition =
        new CameraPosition(target: locationController.location.value, zoom: 17);

    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: mapController.initMapa,
      rotateGesturesEnabled: false,
      zoomGesturesEnabled: false,
      liteModeEnabled: false,
      scrollGesturesEnabled: false,
    );
  }
}
