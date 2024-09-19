import 'package:flutter/material.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:get/get.dart';

class PaymentFormController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Define the controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  // Dispose controllers when not in use
  @override
  void onClose() {
    nameController.dispose();
    cardNumberController.dispose();
    expirationDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  // Function to handle form submission
  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      Get.snackbar('Success', 'Payment information submitted successfully!', snackPosition: SnackPosition.BOTTOM);
      Get.toNamed(greenSubscriptionSubscribedScreen);
    } else {
      Get.snackbar('Error', 'Please fill in all fields correctly.', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
