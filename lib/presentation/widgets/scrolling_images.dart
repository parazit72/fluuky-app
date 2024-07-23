import 'package:flutter/material.dart';

class ScrollingImages extends StatefulWidget {
  final List<String> imagePaths;
  final List<double> speeds;
  final double boxHeight;
  final double boxWidth;

  const ScrollingImages({
    super.key,
    required this.imagePaths,
    required this.speeds,
    this.boxHeight = 100.0,
    this.boxWidth = 400.0,
  });

  @override
  _ScrollingImagesState createState() => _ScrollingImagesState();
}

class _ScrollingImagesState extends State<ScrollingImages> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controllers = widget.speeds.map((speed) {
      return AnimationController(
        vsync: this,
        duration: Duration(seconds: (10 / speed).round()), // Adjust duration based on speed
      )..repeat();
    }).toList();

    _animations = _controllers.map((controller) {
      return Tween<double>(begin: 1.0, end: -1.0).animate(controller);
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage('assets/images/bacground.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16),
          ),
          height: widget.boxHeight,
          width: widget.boxWidth,
          child: Stack(
            children: List.generate(widget.imagePaths.length, (index) {
              return AnimatedBuilder(
                animation: _animations[index],
                builder: (context, child) {
                  return FractionalTranslation(
                    translation: Offset(_animations[index].value, 0),
                    child: child,
                  );
                },
                child: Image.asset(
                  widget.imagePaths[index],
                  fit: BoxFit.cover,
                  width: widget.boxWidth, // Ensure the image width matches the container width
                  repeat: ImageRepeat.repeat,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
