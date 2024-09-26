import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/badges_list_widget.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/transactions_history_list_widget.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/order_history_list_widget.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/referral_rewards_widget.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/trees_planted_with_flukky_widget.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/user_status_section.dart';
import 'package:fluuky/presentation/widgets/welcome_user_avatar.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/your_impact_widget.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('Dashboard')),
      bottomNavigationBar: CustomNavBar(),
      body: ListView(
        children: [
          WelcomeUserAvatar(),
          const UserStatusWidget(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: const Divider()),
          const BadgesListWidget(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20.w), child: const Divider()),
          const YourImpactWidget(),
          const TreesPlantedWithFlukkyWidget(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h), child: const Divider()),
          const OrderHistoryListHorizentalWidget(),
          const TransactionsHistoryListHorizentalWidget(),
          const ReferralRewardsWidget(),
          Obx(() {
            return _authController.isLoading.value ? const Center(child: CircularProgressIndicator()) : Container();
          }),
        ],
      ),
    );
  }
}
