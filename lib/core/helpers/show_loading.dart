part of 'helpers.dart';

/// Funcion que muestra un loading
void showLoading() {
  Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          kBorderRadius,
        )),
        contentPadding: const EdgeInsets.all(20),
        backgroundColor: PeajeColors.grey,
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: LinearProgressIndicator(
            color: PeajeColors.black,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
      barrierDismissible: false);
}
