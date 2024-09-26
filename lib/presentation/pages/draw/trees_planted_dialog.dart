import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/pages/draw/bundle_section.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class TreesPlantedDialog extends StatelessWidget {
  const TreesPlantedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        body: Stack(
          children: [
            Positioned(
              right: 20.w,
              top: 32.h,
              child: IconButton(
                icon: Icon(Icons.close, size: 24.w),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              top: 80.h,
              left: 24.w,
              right: 32.w,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                    child: Text(
                      textAlign: TextAlign.center,
                      t.translate('growMoreTrees'),
                      style: FluukyTheme.lightTheme.textTheme.labelMedium,
                    ),
                  ),
                  BundleSection(
                    title: t.translate('Thrive Bundle'),
                    description: t.translate('ThriveBundleDescription'),
                    ticketsInfo: t.translate('NumberTickets5-9'),
                    discountInfo: t.translate('discount5%'),
                  ),
                  SizedBox(height: 28.h),
                  BundleSection(
                    title: t.translate('flourishBundle'),
                    description: t.translate('flourishBundleDescription'),
                    ticketsInfo: t.translate('NumberTickets10orMore'),
                    discountInfo: t.translate('discount10%'),
                  ),
                  SizedBox(height: 28.h),
                  ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: Text(t.translate('ok'))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
