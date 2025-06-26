// ignore_for_file: must_be_immutable

import 'package:advice_me/Model/item_model.dart';
import 'package:advice_me/controller/LoginCubit/main_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCard extends StatelessWidget {
  ItemCard({super.key, required this.itemModel});
  ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MainCubit.getInstans().goToItemDetails(context, itemModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13.r),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ConditionalBuilder(
                condition: itemModel.image != "" && itemModel.image != null,
                builder: (context) =>
                    Center(child: Image.network(itemModel.image!)),
                fallback: (context) =>
                    Placeholder(color: Color.fromARGB(75, 158, 158, 158)),
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.dg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    itemModel.name ?? "",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        itemModel.rate.toString(),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      for (int i = 0; i < (itemModel.rate ?? 0) - 1; i++)
                        Icon(Icons.star, color: Colors.yellow),
                      (itemModel.rate ?? 1) / ((itemModel.rate ?? 1).toInt()) !=
                              1
                          ? Icon(Icons.star_half, color: Colors.yellow)
                          : Icon(Icons.star, color: Colors.yellow),
                    ],
                  ),
                  Text(
                    "Reviews: ${itemModel.rateCount.toString()}",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  Text(
                    "Price: ${itemModel.price.toString()}",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
