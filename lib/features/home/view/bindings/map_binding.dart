import 'package:get/get.dart';
import 'package:peaje_client/features/home/view/controllers/map_controller.dart';

class MapBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
