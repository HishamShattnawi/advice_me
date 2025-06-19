import 'package:advice_me/Util/bloc_observer.dart';
import 'package:advice_me/Util/constants_values.dart';
import 'package:advice_me/Util/network/local/cache_helper.dart';
import 'package:advice_me/Util/network/remote/dio_helper.dart';
import 'package:advice_me/view/start/splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        ConstValues.screenWidth(context),
        ConstValues.screenHeight(context),
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          // textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
