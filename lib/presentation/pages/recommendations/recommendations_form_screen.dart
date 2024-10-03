import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

import 'package:fluuky/presentation/controllers/raffle_controller.dart';

import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class RecommendationsFormScreen extends StatefulWidget {
  const RecommendationsFormScreen({super.key});

  @override
  State<RecommendationsFormScreen> createState() => _RecommendationsFormScreenState();
}

class _RecommendationsFormScreenState extends State<RecommendationsFormScreen> {
  final RaffleController raffleController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool userIsSubscribed = true;

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('Recommendations')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 32.h),
        child: Stack(
          children: [
            Column(
              children: [
                const SelectYourLocationDecriptionBoxWidget(),
                const UpdateYourInterestBoxWidget(),
                RecommendationsForm(formKey: _formKey),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(recommendationsCreated);
                  },
                  child: Text(t.translate('continue'))),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommendationsForm extends StatelessWidget {
  const RecommendationsForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 20.h),
              Text('Intrests', style: FluukyTheme.lightTheme.textTheme.labelMedium),
              const PickYourInterestsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PickYourInterestsWidget extends StatefulWidget {
  const PickYourInterestsWidget({super.key});

  @override
  _PickYourInterestsWidgetState createState() => _PickYourInterestsWidgetState();
}

class _PickYourInterestsWidgetState extends State<PickYourInterestsWidget> {
  List<String> allInterests = ['Sports', 'Music', 'Movies', 'Books', 'Tech', 'Travel', 'Other +'];

  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8.0,
              runSpacing: 0,
              children: [
                ...selectedInterests.map((interest) {
                  return Chip(
                    label: Text(
                      interest,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    deleteIcon: selectedInterests.last != interest ? null : const Icon(Icons.close, color: Colors.white),
                    onDeleted: selectedInterests.last != interest ? null : () => setState(() => selectedInterests.remove(interest)),
                  );
                })
              ],
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 0,
              children: [
                ...allInterests.where((interest) => !selectedInterests.contains(interest)).map((interest) {
                  return ChoiceChip(
                      label: Text(interest),
                      selected: false,
                      color: WidgetStateProperty.all(Colors.transparent),
                      side: BorderSide(color: Theme.of(context).primaryColor),
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          if (interest == 'Other +') {
                          } else {
                            selectedInterests.add(interest);
                          }
                        });
                      },
                      padding: EdgeInsets.zero);
                }),
              ],
            ),
          ],
        ));
  }
}

class SelectYourLocationDecriptionBoxWidget extends StatelessWidget {
  const SelectYourLocationDecriptionBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Select Your Location & Interests', style: FluukyTheme.lightTheme.textTheme.titleLarge),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Color(0xFFDBDBDB)),
              BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
            ],
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline_rounded, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8), // Add space between the icon and text
              Expanded(
                // Wrap text with Expanded to avoid overflow
                child: Text(
                  'By providing these details, you empower us to curate recommendations that align specifically with your interests, ensuring you receive exclusive offers and discover draws tailored just for you.',
                  style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UpdateYourInterestBoxWidget extends StatelessWidget {
  const UpdateYourInterestBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Select Your Location & Interests', style: FluukyTheme.lightTheme.textTheme.titleLarge),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Color(0xFFDBDBDB)),
              BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
            ],
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline_rounded, color: Theme.of(context).primaryColor),
              const SizedBox(width: 8), // Add space between the icon and text
              Expanded(
                // Wrap text with Expanded to avoid overflow
                child: Text(
                  'By providing these details, you empower us to curate recommendations that align specifically with your interests, ensuring you receive exclusive offers and discover draws tailored just for you.',
                  style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(onPressed: () {}, child: const Text('Update'))
      ],
    );
  }
}
