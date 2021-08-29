import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/helpers/helpers.dart';
import 'package:peaje_client/di/injection_container.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/usecases/user_login.dart';
import 'package:peaje_client/features/auth/view/controllers/user_controller.dart';
import 'package:peaje_client/routes/app_pages.dart';

const String SERVER_FAILURE_MESSAGE = 'Ha ocurrido un error con el servidor';
const String INACTIVE_FAILURE_MESSAGE = 'Tu cuenta aún no ha sido activada';
const String EMAIL_FAILURE_MESSAGE = "El correo no ha sido encontrado";
const String PASSWORD_FAILURE_MESSAGE = "La contraseña no es válida";

/// Este es el controlador de la pagina del login
class LoginController extends GetxController {
  //! Usecases
  /// Importamos funcion que inicia sesion
  final UserLogin userLogin = sl<UserLogin>();

  //! Usecases Implementations

  Future<void> remoteUserLogin() async {
    final Either<Failure, User> result = await userLogin.call(
      UserLoginParams(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
      ),
    );

    _handleUserLogin(result);
  }

  //! Handlers

  // handle api fetch result
  void _handleUserLogin(Either<Failure, User> result) {
    result.fold((failure) {
      /// Removemos el showLoading()
      Get.back();

      Get.snackbar('Error', _mapFailureToMessage(failure),
          snackPosition: SnackPosition.BOTTOM);
    }, (data) {
      /// Le pasamos la data obtenida al controlador del motel
      Get.find<UserController>().user = data;

      /// Removemos el showLoading()
      Get.back();

      /// Vamos a la pagina principal de la app
      Get.toNamed(Routes.HOME);
    });
  }

  //! Formkey

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //! Variables

  /// Controlador de texto que contiene el email
  final TextEditingController emailCtrl = new TextEditingController();

  /// COntrolador de texto que contiene la contrasena
  TextEditingController passwordCtrl = new TextEditingController();

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> loginButtonActive = false.obs;

  //! Validators

  /// Esta funcion verifica si el boton debe ser activado
  void validateButton() {
    if (formKey.currentState!.validate()) {
      loginButtonActive.value = true;
    } else {
      loginButtonActive.value = false;
    }
  }

  /// validar los valores de los controladores de texto
  Future<void> validateLogin() async {
    if (formKey.currentState!.validate()) {
      showLoading();
      await remoteUserLogin();
    } else {
      return;
    }
  }

  @override
  void onReady() {
    emailCtrl.addListener(() {
      validateButton();
    });
    passwordCtrl.addListener(() {
      validateButton();
    });
    super.onReady();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmailFailure:
      return EMAIL_FAILURE_MESSAGE;
    case PasswordFailure:
      return PASSWORD_FAILURE_MESSAGE;
    case InactiveFailure:
      return INACTIVE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
