import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_widgets.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:get/get.dart';

class ActiveDrawsSection extends StatelessWidget {
  const ActiveDrawsSection({super.key});
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    bool userHasActiveCards = false;
    return Padding(
      padding: userHasActiveCards
          ? EdgeInsets.only(
              left: Get.locale == const Locale('ar') ? 0 : 20.w,
              right: Get.locale == const Locale('ar') ? 20.w : 0,
            )
          : EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.translate('Active Draws'), style: FluukyTheme.lightTheme.textTheme.titleLarge),
              userHasActiveCards ? IconButton(onPressed: () => Get.toNamed(activeDraws), icon: const Icon(Icons.chevron_right)) : Container()
            ],
          ),
          SizedBox(height: 10.h),
          userHasActiveCards ? buildUserActiveDrawsList() : const EmptyActiveDraws(),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}

class EmptyActiveDraws extends StatelessWidget {
  const EmptyActiveDraws({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(24.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: FluukyTheme.secondaryColor),
          const BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        borderRadius: BorderRadius.circular(8.w),
        image: const DecorationImage(image: AssetImage('assets/images/paper-box.png'), fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Image.asset('assets/images/ticket.png', fit: BoxFit.cover, width: 64.w),
          ),
          SizedBox(height: 20.h),
          Text(
            t.translate('youreYetToEnter.StartPlantingTrees'),
            style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: FluukyTheme.inputTextColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
              style: ButtonStyle(textStyle: WidgetStateProperty.all(TextStyle(fontSize: 12.w))),
              onPressed: () {},
              child: Text(t.translate('enterNow'))),
        ],
      ),
    );
  }
}
