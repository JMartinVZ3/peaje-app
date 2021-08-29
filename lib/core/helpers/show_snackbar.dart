part of 'helpers.dart';

dynamic showSnackbar({required String body}) {
  Get.snackbar(
    '',
    body,
    duration: Duration(seconds: 5),
    backgroundColor: Colors.white,
    margin: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding, vertical: kHorizontalPadding),
    padding: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding, vertical: kHorizontalPadding / 2),
  );
}
