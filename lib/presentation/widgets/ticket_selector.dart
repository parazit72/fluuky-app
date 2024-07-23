import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NumberPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onChanged;

  NumberPicker({
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late int _currentValue;
  late CarouselController _carouselController;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _carouselController = CarouselController();
  }

  List<int> get _numberRange => List.generate(widget.maxValue - widget.minValue + 1, (index) => widget.minValue + index);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: _numberRange.map((number) {
            return Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontSize: 30,
                  color: number == _currentValue ? Colors.black : const Color.fromARGB(255, 219, 219, 219),
                  fontWeight: number == _currentValue ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }).toList(),
          carouselController: _carouselController,
          options: CarouselOptions(
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            height: 100,
            viewportFraction: 0.15,
            initialPage: _numberRange.indexOf(_currentValue),
            onPageChanged: (index, reason) {
              setState(() {
                _currentValue = _numberRange[index];
              });
              widget.onChanged(_currentValue);
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Container(
              height: 84,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 219, 219, 219), width: 1),
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.5 - 26 - 15,
          // right: MediaQuery.of(context).size.width * 0.5 - 46,
          child: IgnorePointer(
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 219, 219, 219), width: 1),
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
