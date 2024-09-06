import 'package:flutter/material.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final centerPosition = (widget.activeIndex * screenWidth / 4) - screenWidth / 6;
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
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                color: widget.activeIndex == index ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
