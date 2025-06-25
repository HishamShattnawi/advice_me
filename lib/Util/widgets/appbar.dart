// ignore_for_file: must_be_immutable

import 'package:advice_me/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWidget extends StatelessWidget {
  AppbarWidget({super.key, required this.user});
  User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: Colors.grey[300],
          ),
          width: 30.w,
          height: 30.w,
          child: Icon(Icons.person_outline),
        ),
        SizedBox(width: 10.w),
        Text(
          user.fullName,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.r),
            color: Colors.grey[300],
          ),
          width: 30.w,
          height: 30.w,
          child: Icon(Icons.notifications_outlined),
        ),
      ],
    );
    ;
  }
}
