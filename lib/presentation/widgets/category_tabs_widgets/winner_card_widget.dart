import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/winner_entity.dart';

class WinnerCardWidget extends StatelessWidget {
  final WinnerEntity winner;

  const WinnerCardWidget({super.key, required this.winner});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(winner.name),
      ),
    );
  }
}
