import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/layout/app_bar_single.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluuky/domain/entities/raffle_entity.dart';
import 'package:fluuky/presentation/widgets/widgets.dart';
import 'package:jhijri/_src/_jHijri.dart';

class DrawItemScreen extends StatelessWidget {
  final RaffleEntity selectedRaffle;
  const DrawItemScreen({super.key, required this.selectedRaffle});
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return BackgroundScaffold(
      appBar: AppBarSingleWidget(title: t.translate('draw')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSectionWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selectedRaffle.description, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 10),
                  Text(
                    '${t.translate('drawDate')} ${DateFormat('MMMM dd\'th\', yyyy - HH:mm').format(selectedRaffle.deadline)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 10),
                  const DrawDetailsWidget(),
                  const SizedBox(height: 20),
                  NumberPicker(
                    minValue: 1,
                    maxValue: 20,
                    initialValue: 10,
                    onChanged: (value) {
                      print('Selected number: $value');
                    },
                  ),
                  const SizedBox(height: 20),
                  const ScrollingImages(
                    imagePaths: [
                      'assets/images/mountain-layer-1.png',
                      'assets/images/sun.png',
                      'assets/images/mountain-layer-2.png',
                      'assets/images/forest-layer-1.png',
                      'assets/images/forest-layer-2.png',
                      'assets/images/forest-layer-3.png',
                    ],
                    speeds: [1.0, 0.8, 0.5, 0.5, 0.5, 0.5],
                  ),
                  const SizedBox(height: 20),
                  ActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
