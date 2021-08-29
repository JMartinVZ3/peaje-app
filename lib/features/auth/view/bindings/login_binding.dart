import 'package:get/get.dart';
import 'package:peaje_client/features/auth/view/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
