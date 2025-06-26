import 'package:advice_me/Model/user.dart';
import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/Util/widgets/appbar.dart';
import 'package:advice_me/Util/widgets/category.dart';
import 'package:advice_me/Util/widgets/item_card.dart';
import 'package:advice_me/controller/LoginCubit/main_cubit.dart';
import 'package:advice_me/controller/LoginCubit/main_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MainCubit.getInstans(),
      child: BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MainCubit.getInstans();
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(25.dg),
              child: Column(
                children: [
                  AppbarWidget(user: cubit.thisUser),
                  SizedBox(height: 20.h),
                  CategoryWidget(),
                  SizedBox(height: 20.h),
                  Expanded(child: itemBody(context)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget itemBody(BuildContext context) {
    MainCubit cubit = MainCubit.getInstans();
    return ConditionalBuilder(
      condition: cubit.allItems.isNotEmpty,
      builder: (context) {
        final filteredItems = cubit.filterCategory == Category.All
            ? cubit.allItems
            : cubit.allItems
                  .where((item) => item.category == cubit.filterCategory)
                  .toList();
        if (filteredItems.isEmpty) {
          return Text(
            'There Is No Items Here',
            style: TextStyle(fontSize: 20.sp),
          );
        }
        return GridView.builder(
          itemCount: filteredItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.dg,
            mainAxisSpacing: 10.dg,
            mainAxisExtent: 260.h,
          ),
          itemBuilder: (context, index) {
            return ItemCard(itemModel: filteredItems[index]);
          },
        );
      },
      fallback: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
