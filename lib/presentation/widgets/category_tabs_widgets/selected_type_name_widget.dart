import 'package:flutter/material.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';

Widget buildSelectedTypeName(BuildContext context) {
  return Obx(() {
    final ItemsController controller = Get.find();

    final selectedTypeName = _getSelectedTypeName(controller.selectedItemType.value, context);
    return Text(
      selectedTypeName.capitalizeFirst!,
      style: FluukyTheme.lightTheme.textTheme.titleLarge,
      textAlign: TextAlign.start,
    );
  });
}

String _getSelectedTypeName(ItemType type, context) {
  var t = AppLocalizations.of(context)!;

  switch (type) {
    case ItemType.draws:
      return t.translate('Draws');
    case ItemType.winners:
      return t.translate('Winners');
    case ItemType.announcements:
      return t.translate('Winning Announcements');
    default:
      return '';
  }
}
