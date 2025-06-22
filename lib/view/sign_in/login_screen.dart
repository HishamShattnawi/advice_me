import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/Util/responsive.dart';
import 'package:advice_me/Util/widgets/default_button.dart';
import 'package:advice_me/Util/widgets/default_text_filed.dart';
import 'package:advice_me/controller/LoginCubit/login_cubit.dart';
import 'package:advice_me/controller/LoginCubit/login_states.dart';
import 'package:advice_me/view/sign_in/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

var emailController = TextEditingController();
var passController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: LoginCubit.getInstans(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LoginCubit.getInstans();
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ConstValues.MainColor,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SvgPicture.asset('assets/images/start_background.svg'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/Logo.svg'),
                    Card(
                      margin: EdgeInsets.all(responsiveHeight(context, 43)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: responsiveHeight(context, 24),
                          bottom: responsiveHeight(context, 30),
                          left: responsiveWidth(context, 24),
                          right: responsiveWidth(context, 24),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account?",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xFF6C7278),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF25AE4B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            DefaultTextFiled(
                              labelText: "Email",
                              controller: emailController,
                            ),
                            DefaultTextFiled(
                              labelText: "Password",
                              controller: passController,
                              isPassword: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: cubit.checkBoxValue,
                                      onChanged: (value) {
                                        cubit.changeCheckBoxValue();
                                      },
                                    ),
                                    Text(
                                      "Remember me",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xFF6C7278),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF25AE4B),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            DefaultButton(
                              onPressed: () {
                                cubit.login(
                                  context,
                                  email: emailController.text,
                                  pass: passController.text,
                                );
                              },
                              text: "Log In",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
