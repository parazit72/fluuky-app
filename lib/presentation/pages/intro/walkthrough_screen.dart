import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluuky/data/models/walkthrough_page_model.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/pages/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app/config/route_constants.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  State<WalkthroughScreen> createState() => WalkthroughScreenState();
}

class WalkthroughScreenState extends State<WalkthroughScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  final DraggableScrollableController _scrollableController = DraggableScrollableController();
  final List<WalkthroughPageModel> _pages = WalkthroughPageModel.pages;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      int next = _controller.page!.round();
      if (_currentPage != next) {
        setState(() => _currentPage = next);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/short-background.jpg', fit: BoxFit.cover, width: 375.w)),
          Positioned(
            top: 30.h,
            width: 375.w,
            height: 730.h,
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length + 1,
              onPageChanged: (index) {
                if (index == _pages.length) {
                  _navigateHomepage();
                }
              },
              itemBuilder: (context, index) {
                if (index < _pages.length) {
                  return WalkthroughPage(model: _pages[index]);
                } else {
                  return const LoginScreen();
                }
              },
            ),
          ),
          Positioned(
            top: 560.h,
            width: 375.w,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.w),
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  color: Colors.black45,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentPage,
                      count: _pages.length,
                      textDirection: TextDirection.ltr,
                      effect: ScrollingDotsEffect(
                        dotWidth: 8.w,
                        dotHeight: 8.w,
                        dotColor: Colors.white,
                        activeDotColor: FluukyTheme.primaryColor,
                      ),
                      onDotClicked: (index) {
                        _controller.animateToPage(
                          index,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            expand: true,
            maxChildSize: 0.9,
            minChildSize: 0.24,
            initialChildSize: 0.24,
            controller: _scrollableController,
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  if (notification.extent > 0.5) {
                    _navigateHomepage();
                  }
                  return true;
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20.w, right: 20.w, left: 20.w),
                  decoration: BoxDecoration(
                    image: const DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16.w), topRight: Radius.circular(16.w)),
                    boxShadow: const [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: SizedBox(
                      height: 243.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            t.translate('Welcome to FLUUKY!'),
                            textAlign: TextAlign.center,
                            style: FluukyTheme.lightTheme.textTheme.titleLarge,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
                            child: Text(
                              t.translate('plantTreesEnterDrawsGetChanceToWin'),
                              textAlign: TextAlign.center,
                              style: FluukyTheme.lightTheme.textTheme.displaySmall,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _navigateHomepage(),
                            child: Text(t.translate('get_started')),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _navigateHomepage() async {
    Navigator.pushReplacementNamed(context, login);
  }
}

class WalkthroughPage extends StatelessWidget {
  final WalkthroughPageModel model;

  const WalkthroughPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Locale locale = Get.locale ?? const Locale('ar');
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: model.imageheight.h,
          right: 0,
          left: 0,
          child: Image.asset(model.image, width: 375.w, fit: BoxFit.cover),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),
                Text(
                  locale == const Locale('en') ? model.title : model.titleAr,
                  style: FluukyTheme.lightTheme.textTheme.titleLarge!.copyWith(color: FluukyTheme.primaryColor),
                ),
                SizedBox(height: 16.h),
                Text(
                  locale == const Locale('en') ? model.description : model.descriptionAr,
                  style: FluukyTheme.lightTheme.textTheme.displaySmall!.copyWith(color: FluukyTheme.inputTextColor),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
