import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/raffle_card_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class DrawItemScreen extends StatelessWidget {
  final RaffleEntity selectedRaffle;
  const DrawItemScreen({super.key, required this.selectedRaffle});
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('draw')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSectionWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Text(selectedRaffle.description, style: FluukyTheme.lightTheme.textTheme.labelMedium),
                  ),
                  RaffleCardWidget(raffle: selectedRaffle, viewType: ViewType.list),
                  SizedBox(height: 24.h),
                  Container(
                    height: 100.h,
                    width: 375.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.h)),
                      image: const DecorationImage(image: AssetImage('assets/images/empty-box.png'), fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
