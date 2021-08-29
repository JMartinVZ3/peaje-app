import 'package:get/get.dart';
import 'package:peaje_client/features/auth/view/controllers/slideshow_controller.dart';

class SlideshowBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlideshowController>(() => SlideshowController());
  }
}
