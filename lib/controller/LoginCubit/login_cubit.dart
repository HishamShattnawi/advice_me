import 'package:advice_me/controller/LoginCubit/login_states.dart';
import 'package:advice_me/view/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit._() : super(LoginInitialState());
  static LoginCubit? _cubit;
  static LoginCubit getInstans() {
    _cubit ??= LoginCubit._();
    return _cubit!;
  }

  bool checkBoxValue = false;

  void changeCheckBoxValue() {
    checkBoxValue = !checkBoxValue;
    emit(CheckBoxValueChangeState());
  }

  Future<void> login(
    context, {
    required String email,
    required String pass,
  }) async {
    emit(LoginLoadingState());
    print('login');
    print(email);
    print(pass);
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
      (route) => false,
    );
    emit(LoginSuccessState());
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
}
