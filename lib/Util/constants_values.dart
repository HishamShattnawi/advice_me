// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

enum ToastType { success, error, warning, info }

enum Category {
  All,
  Laptops, //1
  Printers, //2
  Mobiles, //3
  HomeAppliances, //4
  Otrhers,
}

class ConstValues {
  ConstValues._();
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static Color MainColor = Color(0xFF32b455);

  static void ShowToast(
    context, {
    required ToastType type,
    required String txt,
  }) {
    switch (type) {
      case ToastType.success:
        CherryToast.success(
          // textDirection: TextDirection.rtl,
          title: Text(txt, style: const TextStyle(color: Colors.black)),
        ).show(context);
        break;
      case ToastType.error:
        CherryToast.error(
          // textDirection: TextDirection.rtl,
          title: Text(txt, style: const TextStyle(color: Colors.black)),
        ).show(context);
        break;
      case ToastType.warning:
        CherryToast.warning(
          // textDirection: TextDirection.rtl,
          title: Text(txt, style: const TextStyle(color: Colors.black)),
        ).show(context);
        break;
      case ToastType.info:
        CherryToast.info(
          // textDirection: TextDirection.rtl,
          title: Text(txt, style: const TextStyle(color: Colors.black)),
        ).show(context);
        break;
    }
  }
}
