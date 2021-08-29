part of 'widgets.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;
  const LoginForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            SizedBox(
              height: kLargePadding,
            ),
            CustomInput(
              validationError: 'Debes introducir el correo electrónico',
              placeholder: 'Email',
              textController: controller.emailCtrl,
              isEmail: true,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: kVerticalPadding,
            ),
            CustomInput(
              validationError: 'Debes introducir la contraseña',
              placeholder: 'Contraseña',
              textController: controller.passwordCtrl,
              isPassword: true,
            ),
            SizedBox(
              height: kVerticalPadding / 2,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Olvidaste tu contraseña?',
                  style: Get.theme.textTheme.bodyText2!.copyWith(
                    fontSize: 14,
                    color: PeajeColors.darkGrey,
                  ),
                )),
            SizedBox(
              height: kVerticalPadding,
            ),
            Obx(
              () => YellowButton(
                text: 'Iniciar Sesión',
                onPressed: () async {
                  await controller.validateLogin();
                },
                active: controller.loginButtonActive.value,
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.REGISTER_EMAIL);
              },
              child: Text(
                'No tienes una cuenta? Registrate',
                style: Get.theme.textTheme.bodyText2!.copyWith(
                  fontSize: 14,
                  color: PeajeColors.darkGrey,
                ),
              ),
            ),
            SizedBox(
              height: kVerticalPadding,
            ),
          ],
        ),
      ),
    );
  }
}
