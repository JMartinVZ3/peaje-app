part of 'helpers.dart';

showAlert(String titulo, String subtitulo) {
  if (Platform.isAndroid) {
    return Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(titulo, style: Get.theme.textTheme.bodyText1),
      content: Text(subtitulo, style: Get.theme.textTheme.bodyText1),
      actions: <Widget>[],
    ));
  }
}
