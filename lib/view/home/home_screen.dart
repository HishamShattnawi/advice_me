import 'package:advice_me/Util/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: responsiveHeight(context, 13)),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 32)),
        child: Center(child: Text('Home Screen')),
      ),
    );
  }
}
