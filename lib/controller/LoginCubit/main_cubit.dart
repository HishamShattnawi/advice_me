import 'dart:convert';

import 'package:advice_me/Model/item_model.dart';
import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/controller/LoginCubit/main_states.dart';
import 'package:advice_me/view/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit._() : super(MainInitialState());
  static MainCubit? _cubit;
  static MainCubit getInstans() {
    _cubit ??= MainCubit._();
    return _cubit!;
  }

  bool checkBoxValue = false;
  Category filterCategory = Category.All;
  List<ItemModel> allItems = [];
  void changeCheckBoxValue() {
    checkBoxValue = !checkBoxValue;
    emit(CheckBoxValueChangeState());
  }

  Future<void> login(
    context, {
    required String email,
    required String pass,
  }) async {
    emit(MainLoadingState());
    print('login');
    print(email);
    print(pass);
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
      (route) => false,
    );
    emit(MainSuccessState());
  }

  void register(
    context, {
    required String name,
    required String email,
    required String barthday,
    required bool genderMale,
    required String pass,
  }) {
    {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
        (route) => false,
      );
    }
  }

  void changeFilterCategory(Category category) {
    filterCategory = category;
    emit(FilterCategoryChangeState());
  }

  Future<dynamic> loadJsonData(String name) async {
    String jsonString = await rootBundle.loadString('assets/data/$name.json');
    final data = jsonDecode(jsonString);

    return data;
  }

  void getAllItems() {
    allItems.clear();
    emit(GatAllItemsLoadingState());
    loadJsonData('items').then((value) {
      for (var element in value) {
        allItems.add(ItemModel.fromJson(element));
      }
      emit(GatAllItemsSuccessState());
    });
  }
}
