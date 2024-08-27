import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluuky/data/models/walkthrough_page_model.dart';
import 'package:fluuky/presentation/pages/auth/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app/config/route_constants.dart';

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
        setState(() {
          _currentPage = next;
        });
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
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/short-background.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 30,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
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
            bottom: MediaQuery.of(context).size.height * 0.32,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.black45,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: _currentPage,
                      count: _pages.length,
                      textDirection: TextDirection.ltr,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotColor: Colors.white,
                        dotHeight: 8,
                        dotWidth: 8,
                      ),
                      onDotClicked: (index) {
                        _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
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
            controller: _scrollableController,
            initialChildSize: 0.30,
            minChildSize: 0.30,
            maxChildSize: 0.9,
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  if (notification.extent > 0.7) {
                    _navigateHomepage();
                  }
                  return true;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/paper.jpg"), fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                    boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.black26, spreadRadius: 0, blurRadius: 4)],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Welcome to Fluuky!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'Plant trees, enter luxury draws, & get a chance to win!',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          ElevatedButton(
                            onPressed: () => _navigateHomepage(),
                            child: const Text('Get Started!'),
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
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.30,
          child: Image.asset(
            model.image,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                Text(model.title, style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 16.0),
                Text(model.description, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
