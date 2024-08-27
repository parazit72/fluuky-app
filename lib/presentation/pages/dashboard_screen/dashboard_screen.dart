import 'package:flutter/material.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/pages/dashboard_screen/badges_list_widget.dart';
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
    return BackgroundScaffold(
      appBar: const AppBarSingleWidget(title: 'Dashboard'),
      bottomNavigationBar: CustomNavBar(),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          WelcomeUserAvatar(),
          const UserStatusWidget(),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()),
          const BadgesListWidget(),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()),
          const YourImpactWidget(),
          const TreesPlantedWithFlukkyWidget(),
          const SizedBox(height: 24),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()),
          const OrderHistoryListWidget(),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()),
          const ReferralRewardsWidget(),
          Obx(() {
            return _authController.isLoading.value ? const Center(child: CircularProgressIndicator()) : Container();
          }),
        ],
      ),
    );
  }
}
