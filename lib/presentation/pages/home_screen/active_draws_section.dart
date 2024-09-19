import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/widgets/category_tabs_widgets/category_tabs_widgets.dart';

class ActiveDrawsSection extends StatelessWidget {
  const ActiveDrawsSection({super.key});
  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    bool userHasActiveCards = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(t.translate('Active Draws'), style: Theme.of(context).textTheme.titleLarge),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right))
          ],
        ),
        !userHasActiveCards ? buildUserActiveDrawsList() : const EmptyActiveDraws(),
      ],
    );
  }
}

class EmptyActiveDraws extends StatelessWidget {
  const EmptyActiveDraws({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(24.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Color(0xFFDBDBDB)),
          BoxShadow(color: Colors.white, spreadRadius: -4.0, blurRadius: 8.6),
        ],
        borderRadius: BorderRadius.circular(8),
        // image: const DecorationImage(image: AssetImage('assets/images/paper.jpg'), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/ticket.png', fit: BoxFit.cover, width: 64),
          const SizedBox(height: 16),
          Text(
            t.translate('youreYetToEnter.StartPlantingTrees'),
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text(t.translate('enterNow')),
          ),
        ],
      ),
    );
  }
}
