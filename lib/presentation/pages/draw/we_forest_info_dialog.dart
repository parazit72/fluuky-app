import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.weforest.org/about-us/');

class WeForestInfoScreen extends StatelessWidget {
  const WeForestInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: BackgroundScaffold(
        body: Stack(
          children: [
            Positioned(
              top: 32.h,
              right: 20.w,
              child: IconButton(
                icon: Icon(Icons.close, size: 24.w),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              top: 165.h,
              left: 44.w,
              right: 44.w,
              bottom: 20.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.h,
                    child: Image.asset('assets/images/weforest-logo.png', fit: BoxFit.contain, height: 121.h),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    t.translate('fluukyPartnerWeForest'),
                    style: FluukyTheme.lightTheme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    t.translate('throughThisPartnership'),
                    style: FluukyTheme.lightTheme.textTheme.labelSmall,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    t.translate('valuesThatInspire'),
                    style: FluukyTheme.lightTheme.textTheme.labelSmall,
                  ),
                  SizedBox(height: 2.h),
                  Wrap(
                    children: <Widget>[
                      ValueChip(t: t, msg: 'Passion'),
                      ValueChip(t: t, msg: 'collaboration'),
                      ValueChip(t: t, msg: 'integrity'),
                    ],
                  ),
                  Wrap(
                    children: <Widget>[
                      ValueChip(t: t, msg: 'transparency'),
                      ValueChip(t: t, msg: 'excellence'),
                    ],
                  ),
                  ValueChip(t: t, msg: 'courage'),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => _launchUrl(t),
                      child: Text(t.translate('Learn More')),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(AppLocalizations t) async {
    if (!await launchUrl(_url)) {
      Get.snackbar('Error', t.translate('Could not launch') + _url.toString());
    }
  }
}

class ValueChip extends StatelessWidget {
  const ValueChip({super.key, required this.t, required this.msg});

  final AppLocalizations t;
  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: FluukyTheme.inputTextColor),
        borderRadius: BorderRadius.all(Radius.circular(50.w)),
        color: Colors.transparent,
      ),
      child: Text(t.translate(msg)),
    );
  }
}
