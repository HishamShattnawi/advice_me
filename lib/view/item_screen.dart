// ignore_for_file: deprecated_member_use

import 'package:advice_me/Model/item_model.dart';
import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/controller/LoginCubit/main_cubit.dart';
import 'package:advice_me/controller/LoginCubit/main_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.dg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              BlocProvider.value(
                value: MainCubit.getInstans(),
                child: BlocConsumer<MainCubit, MainStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var cubit = MainCubit.getInstans();
                    if (cubit.detailsItemModel == null) {
                      Navigator.pop(context);
                      return Container();
                    }
                    ItemModel itemModel = cubit.detailsItemModel!;
                    return Column(
                      children: [
                        ConditionalBuilder(
                          condition:
                              itemModel.image != "" && itemModel.image != null,
                          builder: (context) {
                            return Center(
                              child: Image.network(itemModel.image!),
                            );
                          },
                          fallback: (context) {
                            return Placeholder(
                              color: Color.fromARGB(75, 158, 158, 158),
                              // child: Text("Image"),
                            );
                          },
                        ),

                        SizedBox(height: 20.h),
                        TabsWidget(itemModel: itemModel),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabsWidget extends StatefulWidget {
  TabsWidget({super.key, required this.itemModel});
  ItemModel itemModel;
  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  List<String> tabs = ["Discription", "Advantages", "Disadvantages", "Reviews"];
  String currentTab = "Discription";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(tabs.length, (index) {
              return cat(tabs.elementAt(index));
            }),
          ),
        ),
        SizedBox(height: 20.h),
        body(currentTab),
      ],
    );
  }

  Widget cat(String category) {
    return InkWell(
      onTap: () {
        setState(() {
          currentTab = category;
        });
      },
      overlayColor: WidgetStatePropertyAll(Colors.transparent),
      child: Container(
        padding: EdgeInsets.all(10.dg),
        margin: EdgeInsets.only(right: 10.dg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: currentTab == category ? ConstValues.MainColor : null,
          border: Border.all(color: Color(0xFF85DE9E)),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: currentTab == category ? Colors.white : null,
          ),
        ),
      ),
    );
  }

  Widget body(String category) {
    switch (category) {
      case "Discription":
        return Text(widget.itemModel.description!);
      case "Advantages":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String advantage in widget.itemModel.advantages!)
              Text(advantage),
          ],
        );
      case "Disadvantages":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (String disadvantage in widget.itemModel.disadvantages!)
              Text(disadvantage),
          ],
        );
      case "Reviews":
        return Text("Reviews");
      default:
        return Text("Discription");
    }
  }
}
