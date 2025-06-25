import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/view/sign_in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstValues.MainColor,
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/start_background.svg'),
          Center(
            child: SvgPicture.asset('assets/images/Logo.svg', width: 300.w),
          ),
        ],
      ),
    );
  }
}
