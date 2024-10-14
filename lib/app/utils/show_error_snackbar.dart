import 'package:get/get.dart';

void showErrorSnackbar(String message) {
  Get.snackbar(
    'Error',
    message,
    snackPosition: SnackPosition.TOP,
  );
}
