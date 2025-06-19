import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/Util/responsive.dart';
import 'package:advice_me/Util/widgets/default_button.dart';
import 'package:advice_me/Util/widgets/default_text_filed.dart';
import 'package:advice_me/controller/LoginCubit/login_cubit.dart';
import 'package:advice_me/controller/LoginCubit/login_states.dart';
import 'package:advice_me/view/sign_in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

var emailController = TextEditingController();
var fullNameController = TextEditingController();
var phoneController = TextEditingController();
var dbController = TextEditingController();
var passController = TextEditingController();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: responsiveHeight(context, 50),
                        ),
                        child: SvgPicture.asset('assets/images/Logo.svg'),
                      ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back),
                              ),
                              Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Color(0xFF6C7278),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Text(
                                      "Login",
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
                                labelText: "Full Name",
                                controller: fullNameController,
                              ),
                              DefaultTextFiled(
                                labelText: "Email",
                                controller: emailController,
                              ),
                              DefaultTextFiled(
                                labelText: "Birth of date",
                                controller: dbController,
                              ),
                              DefaultTextFiled(
                                labelText: "Phone Number",
                                controller: phoneController,
                              ),
                              DefaultTextFiled(
                                labelText: "Set Password",
                                controller: passController,
                                isPassword: true,
                              ),
                              DefaultButton(
                                onPressed: () {
                                  cubit.login(
                                    context,
                                    email: emailController.text,
                                    pass: passController.text,
                                  );
                                },
                                text: "Register",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
