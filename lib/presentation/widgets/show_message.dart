import 'package:flutter/material.dart';
import 'package:fluuky/app/config/string_constants.dart';
import 'package:overlay_support/overlay_support.dart';

class ShowMessage {
  static successNotification(String msg, BuildContext context) {
    return showSimpleNotification(
        const Text(
          StringConstants.success,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        context: context,
        background: const Color.fromRGBO(140, 194, 74, 5),
        leading: const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        slideDismissDirection: DismissDirection.up,
        subtitle: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ));
  }

  static errorNotification(String msg, BuildContext context) {
    return showSimpleNotification(
        const Text(StringConstants.failed, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white)),
        context: context,
        background: Colors.red,
        leading: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
        ),
        slideDismissDirection: DismissDirection.up,
        subtitle: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ));
  }

  static warningNotification(String msg, BuildContext context, {String? title}) {
    return showSimpleNotification(
        Text(title ?? StringConstants.warning, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white)),
        context: context,
        background: Colors.amber,
        leading: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        slideDismissDirection: DismissDirection.up,
        subtitle: Text(
          msg,
          style: const TextStyle(color: Colors.white),
        ));
  }

  static showNotification(String? title, String? message, Color? color, Icon icon) {
    return showSimpleNotification(
        Text(
          title!,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        background: color,
        leading: icon,
        slideDismissDirection: DismissDirection.up,
        subtitle: Text(
          message ?? StringConstants.somethingWrong,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
