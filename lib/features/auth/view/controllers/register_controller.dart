import 'dart:io';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaje_client/core/errors/failure.dart';
import 'package:peaje_client/core/helpers/helpers.dart';
import 'package:peaje_client/di/injection_container.dart';
import 'package:peaje_client/features/auth/domain/entities/user.dart';
import 'package:peaje_client/features/auth/domain/usecases/user_register.dart';
import 'package:peaje_client/features/auth/domain/usecases/verify_email.dart';
import 'package:peaje_client/features/auth/domain/usecases/verify_identifier.dart';
import 'package:peaje_client/features/auth/view/controllers/user_controller.dart';
import 'package:peaje_client/routes/app_pages.dart';

enum PhotoState { NotLoaded, Loading, Loaded }

const String SERVER_FAILURE_MESSAGE = 'Ha ocurrido un error con el servidor';
const String REGISTER_FAILURE_MESSAGE = "El correo ya está registrado";

/// Este es el controlador de la pagina del register
class RegisterController extends GetxController {
  //! Usecases

  /// Importamos funcion que verifica si el email ya ha sido utilizado
  final VerifyEmail verifyEmail = sl<VerifyEmail>();

  /// Importamos funcion que verifica si la cedula ya ha sido utilizada
  final VerifyIdentifier verifyIdentifier = sl<VerifyIdentifier>();

  /// Importamos funcion que crea la cuenta del usuario
  final UserRegister userRegister = sl<UserRegister>();

  //! Usecases Implementations

  // Implementation Function to verify the Email
  Future<bool> remoteVerifyEmail(
      {required String email, required String confirmationCode}) async {
    final Either<Failure, bool> result =
        await verifyEmail.call(VerifyEmailParams(
      email: email,
      confirmationCode: confirmationCode,
    ));

    return await _handleVerifyEmail(result);
  }

  Future<void> remoteUserRegister() async {
    final Either<Failure, User> result =
        await userRegister.call(UserRegisterParams(
      email: emailCtrl.text.trim(),
      password: passwordCtrl.text.trim(),
      name: nameCtrl.text,
      lastName: lastNameCtrl.text,
      city: cityCtrl.text,
      photo: profilePhoto!,
      identifier: identifierPhoto!,
      identifierNumber: int.parse(
        identifierCtrl.text.trim().numericOnly(),
      ),
    ));

    _handleUserRegister(result);
  }

  // Implementation Function to verify the Email
  Future<bool> remoteVerifyIdentifier({
    required String identifierNumber,
  }) async {
    final Either<Failure, bool> result =
        await verifyIdentifier.call(VerifyIdentifierParams(
      identifierNumber: identifierNumber,
    ));

    return await _handleVerifyIdentifier(result);
  }

  //! Handlers
  // handle api fetch result
  Future<bool> _handleVerifyEmail(Either<Failure, bool> result) async {
    return result.fold((failure) {
      return false;
    }, (data) async {
      return true;
    });
  }

  // handle api fetch result
  Future<bool> _handleVerifyIdentifier(Either<Failure, bool> result) async {
    return result.fold((failure) {
      return false;
    }, (data) async {
      return true;
    });
  }

  // handle api fetch result
  void _handleUserRegister(Either<Failure, User> result) {
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

  //! Form Keys
  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyEmailConfirmation = GlobalKey<FormState>();

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyIdentifier = GlobalKey<FormState>();

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyName = GlobalKey<FormState>();

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyCity = GlobalKey<FormState>();

  /// Key con la que validamos el formulario del registro
  final GlobalKey<FormState> formKeyPassword = GlobalKey<FormState>();

  //! VARIABLES

  /// Controlador de texto que contiene el email
  final TextEditingController emailCtrl = new TextEditingController();

  /// Controlador de texto que contiene el email
  final TextEditingController emailConfirmationCtrl =
      new TextEditingController();

  /// Controlador de texto que contiene el email
  final TextEditingController identifierCtrl = new TextEditingController();

  /// Controlador de texto que contiene el email
  final TextEditingController nameCtrl = new TextEditingController();

  /// Controlador de texto que contiene el email
  final TextEditingController lastNameCtrl = new TextEditingController();

  /// Controlador de texto que contiene el email
  final TextEditingController cityCtrl = new TextEditingController();

  /// COntrolador de texto que contiene la contrasena
  final TextEditingController passwordCtrl = new TextEditingController();

  /// COntrolador de texto que contiene la contrasena
  final TextEditingController passwordConfirmationCtrl =
      new TextEditingController();

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> registerEmailButtonActive = false.obs;

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> registerEmailConfirmationButtonActive = false.obs;

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> registerIdentifierButtonActive = false.obs;

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> registerNameButtonActive = false.obs;

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> registerCityButtonActive = false.obs;

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> registerPasswordButtonActive = false.obs;

  /// Propiedad que estara en falso si el boton esta inactivo
  Rx<bool> registerProfilePhotoButtonActive = false.obs;

  /// Propiedad que verifica si las claves son las mismas
  Rx<bool> isConfirmationPasswordCorrect = false.obs;

  /// Propiedad que verifica si el codigo introducido es correcto
  Rx<bool> isConfirmationCodeCorrect = false.obs;

  /// Imagen de la cedula
  late File? identifierPhoto;

  /// Imagen de perfil
  late File? profilePhoto;

  /// Codigo de confirmacion que se enviara al correo electronico
  late final String confirmationCode;

  /// Image Picker para la cedula
  final ImagePicker identifierPhotoPicker = ImagePicker();

  /// Image Picker para la foto de perfil
  final ImagePicker profilePhotoPicker = ImagePicker();

  /// Estado de la foto de la cedula
  Rx<PhotoState> identifierPhotoState = PhotoState.NotLoaded.obs;

  /// Estado de la foto de la cedula
  Rx<PhotoState> profilePhotoState = PhotoState.NotLoaded.obs;

  //! Button Validations

  /// Esta funcion verifica si el boton debe ser activado
  void validateEmailButton() {
    if (formKeyEmail.currentState!.validate()) {
      registerEmailButtonActive.value = true;
    } else {
      registerEmailButtonActive.value = false;
    }
  }

  /// Esta funcion verifica si el boton debe ser activado
  void validateEmailConfirmationButton() {
    if (formKeyEmailConfirmation.currentState!.validate()) {
      registerEmailConfirmationButtonActive.value = true;
    } else {
      registerEmailConfirmationButtonActive.value = false;
    }
  }

  /// Esta funcion verifica si el boton debe ser activado
  void validateIdentifierButton() {
    if (formKeyIdentifier.currentState!.validate()) {
      if (identifierPhotoState.value == PhotoState.Loaded) {
        registerIdentifierButtonActive.value = true;
      }
    } else {
      registerIdentifierButtonActive.value = false;
    }
  }

  /// Esta funcion verifica si el boton debe ser activado
  void validateNameButton() {
    if (formKeyName.currentState!.validate()) {
      registerNameButtonActive.value = true;
    } else {
      registerNameButtonActive.value = false;
    }
  }

  /// Esta funcion verifica si el boton debe ser activado
  void validateCityButton() {
    if (formKeyCity.currentState!.validate()) {
      registerCityButtonActive.value = true;
    } else {
      registerCityButtonActive.value = false;
    }
  }

  /// Esta funcion verifica si el boton debe ser activado
  void validatePasswordButton() {
    if (formKeyPassword.currentState!.validate()) {
      registerPasswordButtonActive.value = true;
    } else {
      registerPasswordButtonActive.value = false;
    }
  }

  //! Form Key Validations

  /// Funcion que valida la pagina en la que se pone el email
  void validateEmail() async {
    if (formKeyEmail.currentState!.validate()) {
      /// Mostrar loading mientras se corre la funcion
      showLoading();
      final bool response = await remoteVerifyEmail(
          email: emailCtrl.text.trim(), confirmationCode: confirmationCode);

      if (response) {
        /// Remover el loading
        Get.back();

        /// Para ir a la siguiente pagina
        Get.toNamed(Routes.REGISTER_EMAIL_CONFIRMATION);
      } else {
        /// Remover el loading
        Get.back();

        Get.snackbar(
          'Error',
          "Este correo electrónico ya ha sido utilizado",
          snackPosition: SnackPosition.TOP,
        );
      }
    } else {}
  }

  void validateEmailConfirmation() {
    if (formKeyEmailConfirmation.currentState!.validate()) {
      if (emailConfirmationCtrl.text.trim() == confirmationCode) {
        Get.toNamed(Routes.REGISTER_IDENTIFIER);
      } else {
        isConfirmationCodeCorrect.value = true;
        print(isConfirmationCodeCorrect);
        formKeyEmailConfirmation.currentState!.validate();
      }
    } else {}
  }

  /// Funcion que valida la pagina en la que se introduce la ceduka
  void validateIdentifier() async {
    if (formKeyIdentifier.currentState!.validate()) {
      /// Mostrar loading mientras se corre la funcion
      showLoading();
      final bool response = await remoteVerifyIdentifier(
          identifierNumber: identifierCtrl.text.trim());
      if (response) {
        /// Remover el loading
        Get.back();

        /// Para ir a la siguiente pagina
        Get.toNamed(Routes.REGISTER_NAME);
      } else {
        /// Remover el loading
        Get.back();

        Get.snackbar(
          'Error',
          "Este Numero de cédula ya ha sido utilizado",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {}
  }

  void validateName() {
    if (formKeyName.currentState!.validate()) {
      Get.toNamed(Routes.REGISTER_CITY);
    } else {}
  }

  void validateCity() {
    if (formKeyCity.currentState!.validate()) {
      Get.toNamed(Routes.REGISTER_PASSWORD);
    } else {}
  }

  Future<void> validatePassword() async {
    if (formKeyPassword.currentState!.validate()) {
      if (passwordCtrl.value == passwordConfirmationCtrl.value) {
        Get.toNamed(Routes.REGISTER_PROFILE_PHOTO);
      } else {
        isConfirmationPasswordCorrect.value = true;
        formKeyPassword.currentState!.validate();
      }
    } else {}
  }

  Future<void> validateProfilePhoto() async {
    if (profilePhotoState.value == PhotoState.Loaded) {
      showLoading();
      await remoteUserRegister();
    }
  }

  //! FUNCTION
  /// Fncion que selecciona la foto de la camara del usuario
  selectPhotoIdentifier() async {
    _proccessIdentifierImage(ImageSource.camera);
  }

  /// Funcion que procesa la imagen
  _proccessIdentifierImage(ImageSource source) async {
    identifierPhotoState.value = PhotoState.Loading;
    final pickedFile =
        await identifierPhotoPicker.getImage(source: source, imageQuality: 50);

    if (pickedFile != null) {
      identifierPhoto = File(pickedFile.path);

      /// Actualizamos el estado a cargado
      identifierPhotoState.value = PhotoState.Loaded;

      /// Se valida nuevamente el boton del identificador
      validateIdentifierButton();
    } else {
      /// Actualizamos el estado a no cargada
      identifierPhotoState.value = PhotoState.NotLoaded;
    }
  }

  /// Fncion que selecciona la foto de la camara del usuario
  selectPhotoProfile() async {
    _proccessProfileImage(ImageSource.camera);
  }

  /// Funcion que procesa la imagen
  _proccessProfileImage(ImageSource source) async {
    profilePhotoState.value = PhotoState.Loading;
    final pickedFile = await profilePhotoPicker.getImage(
      source: source,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.front,
    );

    if (pickedFile != null) {
      profilePhoto = File(pickedFile.path);

      /// Actualizamos el estado a cargado
      profilePhotoState.value = PhotoState.Loaded;

      registerProfilePhotoButtonActive.value = true;
    } else {
      registerProfilePhotoButtonActive.value = false;

      /// Actualizamos el estado a no cargada
      profilePhotoState.value = PhotoState.NotLoaded;
    }
  }

  /// Funcion que genera un codigo de 4 digitos
  String generate6DigitCode() {
    String rndnumber = "";
    Random rnd = new Random();
    for (int i = 0; i < 6; i++) {
      rndnumber = rndnumber + rnd.nextInt(9).toString();
    }
    return rndnumber;
  }

  @override
  void onInit() {
    confirmationCode = generate6DigitCode();
    print(confirmationCode);
    super.onInit();
  }

  /// Agregamos un listener a los controladores para poder activar el boton cuando tengan algun valor
  @override
  void onReady() {
    emailCtrl.addListener(() {
      validateEmailButton();
    });
    emailConfirmationCtrl.addListener(() {
      validateEmailConfirmationButton();

      if (emailConfirmationCtrl.text.trim() == confirmationCode) {
      } else {
        isConfirmationCodeCorrect.value = false;
        formKeyEmailConfirmation.currentState!.validate();
      }
    });
    identifierCtrl.addListener(() {
      validateIdentifierButton();
    });
    nameCtrl.addListener(() {
      validateNameButton();
    });
    lastNameCtrl.addListener(() {
      validateNameButton();
    });
    cityCtrl.addListener(() {
      validateCityButton();
    });
    passwordCtrl.addListener(() {
      validatePasswordButton();

      if (passwordCtrl.value == passwordConfirmationCtrl.value) {
      } else {
        isConfirmationPasswordCorrect.value = false;
        formKeyPassword.currentState!.validate();
      }
    });
    passwordConfirmationCtrl.addListener(() {
      validatePasswordButton();

      if (passwordCtrl.value == passwordConfirmationCtrl.value) {
      } else {
        isConfirmationPasswordCorrect.value = false;
        formKeyPassword.currentState!.validate();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    emailConfirmationCtrl.dispose();
    identifierCtrl.dispose();
    nameCtrl.dispose();
    lastNameCtrl.dispose();
    cityCtrl.dispose();
    passwordCtrl.dispose();

    super.onClose();
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case RegisterFailure:
      return REGISTER_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
