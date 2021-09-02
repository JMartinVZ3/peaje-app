import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peaje_client/common.dart';
import 'package:peaje_client/core/widgets/widgets.dart';
import 'package:peaje_client/features/auth/view/widgets/widgets.dart';
import 'package:peaje_client/features/home/view/controllers/location_controller.dart';
import 'package:peaje_client/routes/app_pages.dart';
import 'package:permission_handler/permission_handler.dart';

class GpsAccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.red,
              )),
          Flexible(
            child: YellowButton(
                text: 'Permitir Ubicacion',
                onPressed: () async {
                  final PermissionStatus status =
                      await Permission.location.request();
                  await this.accesoGPS(status);
                }),
          )
        ],
      ),
    );
  }

  Future accesoGPS(PermissionStatus status) async {
    switch (status) {
      case PermissionStatus.granted:
        final LocationController locationController =
            Get.put(LocationController());
        locationController.startFollowing();

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        final Position location = await Geolocator.getCurrentPosition();

        locationController
            .onLocationChanged(LatLng(location.latitude, location.longitude));

        Get.back();

        Get.toNamed(Routes.MARK_LOCATION);
        break;

      case PermissionStatus.limited:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
  }
}
