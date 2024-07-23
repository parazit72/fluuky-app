import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuky/app/di/dependency_injection.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/utils/app_navigation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/config/fluuky_theme.dart';
import 'app/utils/theme_provider.dart';
import 'app/config/route_constants.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await DependencyInjection.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const RestartWidget(child: FluukyApp()));
  FlutterNativeSplash.remove();
}

class FluukyApp extends StatelessWidget {
  const FluukyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider themeNotifier, child) {
            return GetMaterialApp(
              theme: FluukyTheme.lightTheme,
              themeMode: ThemeMode.system,
              initialRoute: splash,
              onGenerateRoute: generateRoute,
              title: "Fluuky App",
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});
  final Widget child;

  static restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<StatefulWidget> createState() {
    return _RestartWidgetState();
  }
}

class _RestartWidgetState extends State<RestartWidget> {
  Key _key = UniqueKey();
  void restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: _key,
      child: widget.child,
    );
  }
}
