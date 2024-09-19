import 'package:flutter/material.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  var currentQuestionIndex = 0.obs; // Observable for the current question index
  RxList<int?> userChoices = List<int?>.filled(14, null).obs; // Stores user selections

  void selectChoice(int index, int choice) {
    userChoices[index] = choice; // Save the user's choice for each question
  }

  void nextQuestion(BuildContext context) {
    if (currentQuestionIndex.value < 13) {
      currentQuestionIndex.value++;
    } else {
      showSubmitSheet(context); // Show bottom sheet when on the last question
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
    }
  }

  void showSubmitSheet(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
          ),
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(t.translate('Almost There!'), style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 6),
              Text(t.translate('Ready to discover your results?'),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: FluukyTheme.thirdColor)),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(estimatedCarbonFootprintScreen); // Navigate to the result page
                },
                child: Text(t.translate('Calculate')),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Get.back(); // Close the sheet to edit answers
                },
                child: Text(t.translate('Edit Answers')),
              ),
            ],
          ),
        );
      },
    );
  }
}
