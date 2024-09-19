import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluuky/app/config/fluuky_theme.dart';
import 'package:fluuky/l10n/app_localizations.dart';
import 'package:fluuky/presentation/controllers/items_controller.dart';
import 'package:get/get.dart';

Widget buildViewButtons(context) {
  return Container(
    margin: const EdgeInsets.only(top: 12, bottom: 24),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      boxShadow: [
        BoxShadow(color: FluukyTheme.primaryColor.withOpacity(0.15)),
        const BoxShadow(color: Color(0xFFE9EFEB), spreadRadius: -4.0, blurRadius: 8.6),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildViewButton(ViewType.list, context),
        _buildViewButton(ViewType.grid, context),
      ],
    ),
  );
}

Widget _buildViewButton(ViewType type, context) {
  var t = AppLocalizations.of(context)!;

  final ItemsController controller = Get.find();
  return Obx(() {
    bool isSelected = controller.viewType.value == type;
    return Expanded(
      child: Container(
        height: 36,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(7)),
        ),
        child: TextButton(
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          child: Wrap(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4, left: 4),
                child: SvgPicture.asset(type == ViewType.list ? "assets/images/list.svg" : "assets/images/grid.svg",
                    width: 16, colorFilter: ColorFilter.mode(isSelected ? Theme.of(Get.context!).primaryColor : Colors.black, BlendMode.srcIn)),
              ),
              Text(t.translate(type.name.capitalizeFirst!),
                  style:
                      Theme.of(Get.context!).textTheme.titleMedium!.copyWith(color: isSelected ? Theme.of(Get.context!).primaryColor : Colors.black)),
            ],
          ),
          onPressed: () => controller.viewType.value = type,
        ),
      ),
    );
  });
}
