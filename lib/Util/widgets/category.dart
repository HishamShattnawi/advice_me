// ignore_for_file: must_be_immutable

import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/controller/LoginCubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  var cubit = MainCubit.getInstans();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(Category.values.length, (index) {
          return cat(Category.values[index]);
        }),
      ),
    );
  }

  Widget cat(Category category) {
    return InkWell(
      onTap: () {
        cubit.changeFilterCategory(category);
      },
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        padding: EdgeInsets.all(10.dg),
        margin: EdgeInsets.only(right: 10.dg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: cubit.filterCategory == category
              ? ConstValues.MainColor
              : null,
          border: Border.all(color: Color(0xFF85DE9E)),
        ),
        child: Text(
          category.name,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: cubit.filterCategory == category ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
