import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peaje_client/core/helpers/helpers.dart';
import 'package:peaje_client/features/home/view/controllers/location_controller.dart';
import 'package:peaje_client/routes/app_pages.dart';

/// Estados de la pagina
enum PageState {
  Journey,
  Account,
}

/// Estados del viaje
enum JourneyState {
  Start,
  Qr,
  End,
}

/// Estados de la ciudad
enum CityState {
  Portoviejo,
  Guayaquil,
}

/// Controlador de la pagina de inicio
class HomeController extends GetxController {
  //! Variables
  /// Importamos el controlador de la ubicacion
  final LocationController locationController = Get.put(LocationController());

  /// Variable que contiene el estado de las paginas
  Rx<PageState> pageState = PageState.Journey.obs;

  /// Variable que contiene el estado del viaje
  Rx<JourneyState> journeyState = JourneyState.Start.obs;

  /// Variable que contiene el estado de la ciudad de la que sale el usuario
  Rx<CityState> cityState = CityState.Portoviejo.obs;

  //! Functions

  /// Esta funcion valida el form del register page 2
  Future<void> validateLocation() async {
    showLoading();

    bool serviceEnabled = false;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get
        ..back()
        ..toNamed(Routes.GPS_ACCESS);
    }

    permission = await Geolocator.checkPermission();

    switch (permission) {
      case LocationPermission.denied:
        Get.back();

        Get.toNamed(Routes.GPS_ACCESS);
        break;
      case LocationPermission.whileInUse:
        locationController.startFollowing();

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        final Position location = await Geolocator.getCurrentPosition();

        locationController
            .onLocationChanged(LatLng(location.latitude, location.longitude));

        if (locationController.locationExists.value) {
          Get
            ..back()
            ..toNamed(Routes.MARK_LOCATION);
        } else {
          Get.back();
        }

        break;
      case LocationPermission.always:
        locationController.startFollowing();

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        final Position location = await Geolocator.getCurrentPosition();

        locationController
            .onLocationChanged(LatLng(location.latitude, location.longitude));

        Get.back();

        Get.toNamed(Routes.MARK_LOCATION);
        break;
      case LocationPermission.deniedForever:
        Get.back();

        Get.toNamed(Routes.GPS_ACCESS);
        break;

      default:
        Get.back();

        Get.toNamed(Routes.GPS_ACCESS);
    }
  }
}
