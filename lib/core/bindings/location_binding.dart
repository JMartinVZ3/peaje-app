import 'package:get/get.dart';
import 'package:peaje_client/core/controllers/location_controller.dart';

class LocationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
