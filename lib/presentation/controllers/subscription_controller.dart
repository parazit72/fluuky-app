import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  // Observable properties
  var nextBillingDate = DateTime.now().add(const Duration(days: 30)).obs;
  var billedWith = 'Credit Card'.obs;
  var isAutomaticRenewal = true.obs;

  // Method to update the next billing date
  void updateNextBillingDate(DateTime date) {
    nextBillingDate.value = date;
  }

  // Method to update the billing method
  void updateBilledWith(String method) {
    billedWith.value = method;
  }

  // Method to toggle the automatic subscription renewal
  void toggleAutomaticRenewal() {
    isAutomaticRenewal.value = !isAutomaticRenewal.value;
  }
}
