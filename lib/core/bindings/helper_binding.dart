import 'package:get/get.dart';
import 'package:peaje_client/core/controllers/helper_controller.dart';

class HelperBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelperController>(() => HelperController());
  }
}
