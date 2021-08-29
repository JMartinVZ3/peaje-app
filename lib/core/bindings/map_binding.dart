import 'package:get/get.dart';
import 'package:peaje_client/core/controllers/map_controller.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
