import 'package:get/get.dart';
import 'package:peaje_client/features/auth/view/bindings/loading_binding.dart';
import 'package:peaje_client/features/auth/view/bindings/login_binding.dart';
import 'package:peaje_client/features/auth/view/bindings/register_binding.dart';
import 'package:peaje_client/features/auth/view/bindings/slideshow_binding.dart';
import 'package:peaje_client/features/auth/view/pages/loading_page.dart';
import 'package:peaje_client/features/auth/view/pages/login_page.dart';
import 'package:peaje_client/features/auth/view/pages/register_city_page.dart';
import 'package:peaje_client/features/auth/view/pages/register_email_confirmation_page.dart';
import 'package:peaje_client/features/auth/view/pages/register_email_page.dart';
import 'package:peaje_client/features/auth/view/pages/register_identifier_page.dart';
import 'package:peaje_client/features/auth/view/pages/register_name_page.dart';
import 'package:peaje_client/features/auth/view/pages/register_password_page.dart';
import 'package:peaje_client/features/auth/view/pages/register_profile_photo_page.dart';
import 'package:peaje_client/features/auth/view/pages/slideshow_page.dart';
import 'package:peaje_client/features/home/view/bindings/home_binding.dart';
import 'package:peaje_client/features/home/view/pages/choose_city_page.dart';
import 'package:peaje_client/features/home/view/pages/generate_qr_page.dart';
import 'package:peaje_client/features/home/view/pages/gps_acces_page.dart';
import 'package:peaje_client/features/home/view/pages/home_page.dart';
import 'package:peaje_client/features/home/view/pages/mark_location_page.dart';
import 'package:peaje_client/features/home/view/pages/user_identifier_page.dart';
import 'package:peaje_client/features/home/view/pages/user_information_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    //! AUTH
    /// Pagina del loading, la cual se abre al abrir la app
    GetPage(
      name: Routes.LOADING,
      page: () => LoadingPage(),
      transition: Transition.native,
      binding: LoadingBinding(),
    ),

    /// Pagina en la que se encuentra el slideshow
    GetPage(
      name: Routes.SLIDESHOW,
      page: () => SlideshowPage(),
      transition: Transition.native,
      binding: SlideshowBinding(),
    ),

    /// Pagina DEL lOGIN
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      transition: Transition.native,
      binding: LoginBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.REGISTER_EMAIL,
      page: () => RegisterEmailPage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.REGISTER_EMAIL_CONFIRMATION,
      page: () => RegisterEmailConfirmationPage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.REGISTER_IDENTIFIER,
      page: () => RegisterIdentifierPage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.REGISTER_NAME,
      page: () => RegisterNamePage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.REGISTER_CITY,
      page: () => RegisterCityPage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.REGISTER_PASSWORD,
      page: () => RegisterPasswordPage(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.REGISTER_PROFILE_PHOTO,
      page: () => RegisterProfilePhoto(),
      transition: Transition.native,
      binding: RegisterBinding(),
    ),
    //! HOME

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      transition: Transition.native,
      binding: HomeBinding(),
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.USER_IDENTIFIER,
      page: () => UserIdentifierPage(),
      transition: Transition.native,
    ),

    /// Pagina en la que se encuentra el registro
    GetPage(
      name: Routes.USER_INFORMATION,
      page: () => UserInformationPage(),
      transition: Transition.native,
    ),

    //! JOURNEY

    /// Pagina en la que se escoge la ciudad
    GetPage(
      name: Routes.CHOOSE_CITY,
      page: () => ChooseCityPage(),
      transition: Transition.native,
    ),

    /// Pagina en la que se muestra el codigo Qr
    GetPage(
      name: Routes.GENERATE_QR,
      page: () => GenerateQrPage(),
      transition: Transition.native,
    ),

    /// Pagina en la que se escoge la localizacion
    GetPage(
      name: Routes.MARK_LOCATION,
      page: () => MarkLocationPage(),
      transition: Transition.native,
    ),

    /// Pagina en la que se escoge la localizacion
    GetPage(
      name: Routes.GPS_ACCESS,
      page: () => GpsAccessPage(),
      transition: Transition.native,
    )
  ];
}
