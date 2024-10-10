import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/type_button_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';

class WinnerScreen extends StatefulWidget {
  const WinnerScreen({super.key});

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<WinnerScreen> {
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('Green Subscription')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TypeButtonWidget(type: ItemType.draws, text: t.translate('Draws')),
                  SizedBox(width: 16.w),
                  TypeButtonWidget(type: ItemType.winners, text: t.translate('Winners')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
