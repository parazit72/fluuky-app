import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarSingleWidget extends StatelessWidget {
  final String title;

  const AppBarSingleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF7F7F7),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFF7F7F7),
        statusBarColor: Color(0xFFF7F7F7),
      ),
      shadowColor: Colors.black,
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.chevron_left, size: 24),
      ),
      leadingWidth: 24,
      elevation: 2,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
