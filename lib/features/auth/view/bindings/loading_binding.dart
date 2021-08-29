import 'package:get/get.dart';
import 'package:peaje_client/features/auth/view/controllers/loading_controller.dart';

class LoadingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingController>(() => LoadingController());
  }
}
