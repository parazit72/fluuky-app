import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_dialog.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:get/get.dart';

class SingleBadgeScreen extends StatelessWidget {
  final String imagePath;
  const SingleBadgeScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        appBar: const AppBarDialog(),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Stack(
            children: [
              Positioned(
                top: 70.h,
                left: 0,
                right: 0,
                child: Column(children: [
                  Text(
                    '${t.translate('congratulations')} John Doe!',
                    style: FluukyTheme.lightTheme.textTheme.displaySmall,
                    // textAlign: TextAlign.center,
                  ),
                  Text(
                    t.translate('youve_just_earned_your_first_badge'),
                    style: FluukyTheme.lightTheme.textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  Container(
                    width: 152.w,
                    height: 152.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        imagePath,
                        width: 72.w,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(t.translate('eco_guardian'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
                  SizedBox(height: 16.h),
                  SizedBox(
                      width: 239.w,
                      child: Text(t.translate('feel_good_knowing_you_have_planted_10_trees'),
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelMedium)),
                ]),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () => Get.back(), child: Text(t.translate('THANK YOU FOR YOUR IMPACT'))),
                    SizedBox(height: 16.h),
                    OutlinedButton(onPressed: () {}, child: Text(t.translate('share')))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
