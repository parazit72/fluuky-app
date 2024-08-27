import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/route_constants.dart';
import 'package:fluuky/domain/entities/user_entity.dart';
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
    UserEntity? user = _authController.user.value;
    user = UserEntity(id: '1', name: 'John Doe', email: 'john.doe@example.com', avatar: 'assets/images/avatar.jpg', token: '');

    return BackgroundScaffold(
      appBar: const AppBarFluuky(),
      bottomNavigationBar: CustomNavBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 12),
            WelcomeUserAvatar(),
            const Divider(),
            _buildListItem('dashboard', 'Dashboard', dashboard),
            _buildListItem('profile', 'Profile', profilePreferences),
            _buildListItem('recommendations', 'Recommendations', recommendations),
            _buildListItem('heart', 'Wishlist', wishlist),
            _buildListItem('logo-green', 'Green Subscription', greenSubscription),
            _buildListItem('packages', 'Packages', packages),
            _buildListItem('notifications', 'Notifications', notifications),
            ListTile(
                leading: SvgPicture.asset('assets/images/logout.svg', colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                title: const Text('Log Out'),
                onTap: () {
                  _authController.logout();
                  Get.offAllNamed(login);
                }),
            Obx(() {
              return _authController.isLoading.value ? const Center(child: CircularProgressIndicator()) : Container();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String icon, String title, String route) {
    return ListTile(
        leading: SvgPicture.asset(
          'assets/images/$icon.svg',
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        title: Text(title),
        onTap: () => Get.toNamed(route));
  }
}
