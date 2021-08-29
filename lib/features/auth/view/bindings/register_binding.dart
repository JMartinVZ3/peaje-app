import 'package:get/get.dart';
import 'package:peaje_client/features/auth/view/controllers/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
