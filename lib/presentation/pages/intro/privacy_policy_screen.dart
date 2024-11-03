import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final List<Map<String, String>> textParts = [
    {
      'heading': '1. Introduction',
      'content':
          '1.  Gorem ipsum dolor sit amet, consectetur adipiscing elit.\n\n1.1. Sorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.\n\n1.2. Dorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.\n\n1.3. Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.',
    },
    {
      'heading': '2. Main Content',
      'content':
          '1.  Gorem ipsum dolor sit amet, consectetur adipiscing elit.\n\n1.1. Sorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.\n\n1.2. Dorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.\n\n1.3. Qorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('privacy_policy')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView.builder(
          itemCount: textParts.length,
          itemBuilder: (context, index) {
            final part = textParts[index];
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 32.h),
              Text(
                '${part['heading']}',
                style: FluukyTheme.lightTheme.textTheme.titleLarge,
              ),
              SizedBox(height: 24.h),
              Text(
                '${part['content']}',
                style: FluukyTheme.lightTheme.textTheme.labelMedium,
              ),
              SizedBox(height: 16.h),
            ]);
          },
        ),
      ),
    );
  }
}
