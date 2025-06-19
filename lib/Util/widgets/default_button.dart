// ignore_for_file: must_be_immutable

import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/Util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  Function() onPressed;
  Widget? child;
  String text;
  DefaultButton({
    super.key,
    required this.onPressed,
    this.child,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 10)),
      child: MaterialButton(
        minWidth: ConstValues.screenWidth(context),
        height: 48,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        onPressed: onPressed,
        color: ConstValues.MainColor,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
