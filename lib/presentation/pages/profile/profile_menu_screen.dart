import 'package:flutter/material.dart';
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
            _buildListItem(Icons.space_dashboard_rounded, 'Dashboard', dashboard),
            _buildListItem(Icons.person, 'Profile', profile),
            _buildListItem(Icons.recommend, 'Recommendations', recommendations),
            _buildListItem(Icons.favorite, 'Wishlist', wishlist),
            _buildListItem(Icons.subscriptions, 'Green Subscription', greenSubscription),
            _buildListItem(Icons.stacked_bar_chart, 'Packages', packages),
            _buildListItem(Icons.notifications, 'Notifications', notifications),
            _buildListItem(Icons.logout, 'Log Out', logout),
            Obx(() {
              return _authController.isLoading.value ? const Center(child: CircularProgressIndicator()) : Container();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(IconData icon, String title, String route) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: () => Get.toNamed(route));
  }
}
