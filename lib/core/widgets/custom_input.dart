part of "widgets.dart";

class CustomInput extends StatelessWidget {
  final String validationError;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isNumericValue;
  final bool isEmail;
  final bool isConfirmationPassword;
  final bool isIdentifier;
  final bool isConfirmationMail;

  const CustomInput({
    required this.validationError,
    required this.placeholder,
    required this.textController,
    this.isNumericValue = false,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isConfirmationPassword = false,
    this.isIdentifier = false,
    this.isConfirmationMail = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      cursorColor: Theme.of(context).accentColor,
      style: TextStyle(
        color: PeajeColors.white,
      ),
      controller: this.textController,
      autocorrect: false,
      keyboardType: this.keyboardType,
      obscureText: this.isPassword,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(
            color: PeajeColors.darkGrey,
            width: 5.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(
            color: PeajeColors.darkGrey,
            width: 5.0,
          ),
        ),
        fillColor: PeajeColors.darkGrey,
        hoverColor: Colors.red,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        errorStyle: Get.theme.textTheme.bodyText2!
            .copyWith(color: Colors.red, fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(
            color: PeajeColors.darkGrey,
            width: 5.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorderRadius),
          borderSide: BorderSide(
            color: PeajeColors.darkGrey,
            width: 5.0,
          ),
        ),
        hintText: this.placeholder,
        hintStyle: Get.theme.textTheme.bodyText2!
            .copyWith(color: PeajeColors.grey, fontSize: 14),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) {
        if (isConfirmationPassword) {
          return 'No es la misma clave';
        }

        if (isConfirmationMail) {
          return 'El código no es válido, puedes pedir uno nuevo';
        }

        if (value == null) {
          return "No se ha introducido ningun valor";
        } else {
          if (isIdentifier) {
            if (isNumeric(value) && value.length == 10) {
              return null;
            } else {
              return this.validationError;
            }
          }

          if (isEmail) {
            if (isValidEmail(value)) {
              return null;
            } else {
              return this.validationError;
            }
          } else {
            if (isNumericValue) {
              if (isNumeric(value)) {
                return null;
              } else {
                return this.validationError;
              }
            } else {
              if (value.length < 3) {
                return this.validationError;
              } else {
                return null;
              }
            }
          }
        }
      },
    );
  }
}
