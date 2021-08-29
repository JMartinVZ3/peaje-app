import 'package:get/get.dart';
import 'package:peaje_client/features/home/view/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
