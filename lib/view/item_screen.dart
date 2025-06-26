import 'package:advice_me/controller/LoginCubit/main_cubit.dart';
import 'package:advice_me/controller/LoginCubit/main_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: MainCubit.getInstans(),
        child: BlocConsumer<MainCubit, MainStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MainCubit.getInstans();
            return Center(child: Text(cubit.detailsItemModel?.name ?? ""));
          },
        ),
      ),
    );
  }
}
