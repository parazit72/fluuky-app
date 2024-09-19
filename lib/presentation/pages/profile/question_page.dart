import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/question_controller.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class QuestionPage extends StatelessWidget {
  final QuestionController controller = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    final QuestionController controller = Get.put(QuestionController());
    PageController pageController = PageController();

    var t = AppLocalizations.of(context)!;

    return Obx(() => BackgroundScaffold(
          appBar: AppBarSingleWidget(
            title: '${t.translate('Question')} ${controller.currentQuestionIndex.value + 1}/14',
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  // Wrap the SingleChildScrollView with Expanded to handle height properly
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the current question string
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/q_${controller.currentQuestionIndex.value + 1}.svg',
                              width: 48,
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              child: Text(t.translate('question_text_${controller.currentQuestionIndex.value}')),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Display the radio buttons as options
                        ...List.generate(6, (choiceIndex) {
                          return Container(
                            height: 64,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/choice.png"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Center(
                              child: RadioListTile<int>(
                                activeColor: FluukyTheme.primaryColor, // Circle color when active
                                fillColor: WidgetStateProperty.all(FluukyTheme.primaryColor), // Circle fill color
                                value: choiceIndex,
                                groupValue: controller.userChoices[controller.currentQuestionIndex.value],
                                onChanged: (value) {
                                  controller.userChoices[controller.currentQuestionIndex.value] = value!;
                                  controller.update();
                                },
                                title: Text(t.translate('choice_${controller.currentQuestionIndex.value}_$choiceIndex')),
                                shape: RoundedRectangleBorder(
                                  // Add border around the tile
                                  side: BorderSide(color: FluukyTheme.primaryColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Adds space between content and buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the end
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.nextQuestion(context); // Pass context to open the sheet
                      },
                      child: Text(t.translate('Continue')),
                    ),
                    const SizedBox(height: 16), // Adds space between the buttons
                    if (controller.currentQuestionIndex.value > 0)
                      OutlinedButton(
                        onPressed: () => controller.previousQuestion(),
                        child: Text(t.translate('Back')),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
