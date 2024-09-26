import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDotIndicator extends StatefulWidget {
  final int count;
  final int activeIndex;
  final Function(int) onDotClicked;

  const CustomDotIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
    required this.onDotClicked,
  });

  @override
  _CustomDotIndicatorState createState() => _CustomDotIndicatorState();
}

class _CustomDotIndicatorState extends State<CustomDotIndicator> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant CustomDotIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scrollToCenter();
  }

  void _scrollToCenter() {
    final centerPosition = (widget.activeIndex * 94.w) - 62.w;
    _scrollController.animateTo(
      centerPosition.toDouble(),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.count,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => widget.onDotClicked(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 4,
              width: 94.w,
              decoration: BoxDecoration(
                color: widget.activeIndex == index ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(12.w),
              ),
            ),
          );
        },
      ),
    );
  }
}
