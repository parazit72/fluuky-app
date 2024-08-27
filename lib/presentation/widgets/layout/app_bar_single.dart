import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppBarSingleWidget extends StatelessWidget {
  final String title;

  const AppBarSingleWidget({super.key, required this.title});

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
        // style: ButtonStyle(
        //   minimumSize: WidgetStateProperty.all(const Size(24, 40)),
        //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // ),
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.chevron_left, size: 24),
      ),
      leadingWidth: 40,
      elevation: 2,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
