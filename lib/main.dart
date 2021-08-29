import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/di/injection_container.dart' as di;
import 'package:peaje_client/features/auth/view/bindings/loading_binding.dart';
import 'package:peaje_client/features/auth/view/controllers/user_controller.dart';
import 'package:peaje_client/routes/app_pages.dart';
import 'package:peaje_client/theme/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peaje Client',
      initialRoute: Routes.LOADING,
      theme: lightTheme,
      defaultTransition: Transition.fade,
      initialBinding: LoadingBinding(),
      getPages: AppPages.pages,
    );
  }
}
