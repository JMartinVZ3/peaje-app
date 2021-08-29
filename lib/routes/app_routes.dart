part of './app_pages.dart';

abstract class Routes {
  //! AUTH
  /// Pagina del loading, la cual se abre al abrir la app
  static const LOADING = '/';

  /// Pagina en la que se encuentra el slideshow
  static const SLIDESHOW = '/slideshow';

  /// Pagina en la que se encuentra el slideshow
  static const LOGIN = '/auth/login';

  /// Pagina en la que se encuentra el slideshow
  static const REGISTER_EMAIL = '/auth/register-email';

  /// Pagina en la que se encuentra el slideshow
  static const REGISTER_EMAIL_CONFIRMATION =
      '/auth/register-email-confirmation';

  /// Pagina en la que se encuentra el slideshow
  static const REGISTER_IDENTIFIER = '/auth/register-identifier';

  /// Pagina en la que se encuentra el slideshow
  static const REGISTER_NAME = '/auth/register-name';

  /// Pagina en la que se encuentra el slideshow
  static const REGISTER_CITY = '/auth/register-city';

  /// Pagina en la que se encuentra el slideshow
  static const REGISTER_PASSWORD = '/auth/register-password';

  /// Pagina en la que se encuentra el slideshow
  static const REGISTER_PROFILE_PHOTO = '/auth/profile-photo';

  //! HOME

  /// Pagina del loading, la cual se abre al abrir la app
  static const HOME = '/home';

  /// Pagina del loading, la cual se abre al abrir la app
  static const USER_IDENTIFIER = '/user-identifier';

  /// Pagina del loading, la cual se abre al abrir la app
  static const USER_INFORMATION = '/user-information';
}
