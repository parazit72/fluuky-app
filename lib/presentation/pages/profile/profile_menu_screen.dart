import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/controllers.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_fluuky_widget.dart';
import 'package:fluuky/presentation/widgets/layout/background_scaffold.dart';
import 'package:fluuky/presentation/widgets/layout/custom_nav_bar.dart';
import 'package:fluuky/presentation/widgets/welcome_user_avatar.dart';
import 'package:get/get.dart';

class ProfileMenuScreen extends StatefulWidget {
  const ProfileMenuScreen({super.key});

  @override
  _ProfileMenuScreenState createState() => _ProfileMenuScreenState();
}

class _ProfileMenuScreenState extends State<ProfileMenuScreen> {
  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      appBar: const AppBarFluuky(showIcon: true),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: ListView(
          children: [
            SizedBox(height: 12.h),
            WelcomeUserAvatar(),
            const Divider(),
            SizedBox(height: 24.h),
            _buildListItem('dashboard', 'Dashboard', dashboard),
            _buildListItem('profile', 'Profile', profilePreferences),
            _buildListItem('recommendations', 'Recommendations', recommendations),
            _buildListItem('heart', 'Wishlist', wishlist),
            _buildListItem('logo-green', 'Green Subscription', greenSubscription),
            _buildListItem('packages', 'Packages', packages),
            _buildListItem('notifications', 'Notifications', notifications),
            _buildListItem('logout', 'Log Out', login, logoutToo: true),
            Obx(() {
              return _authController.isLoading.value ? const Center(child: CircularProgressIndicator()) : Container();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String icon, String title, String route, {bool logoutToo = false}) {
    var t = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/$icon.svg',
            width: 20.w,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          SizedBox(width: 8.w),
          InkWell(
            child: Text(
              t.translate(title),
              style: FluukyTheme.lightTheme.textTheme.labelMedium,
            ),
            onTap: () {
              if (logoutToo) _authController.logout();

              Get.toNamed(route);
            },
          )
        ],
      ),
    );
  }
}
