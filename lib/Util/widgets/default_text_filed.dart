// ignore_for_file: must_be_immutable

import 'package:advice_me/Util/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFiled extends StatefulWidget {
  DefaultTextFiled({
    super.key,
    required this.labelText,
    this.validator,
    required this.controller,
    this.isPassword = false,
  });

  bool isPassword = false;
  bool showPassword = false;
  String labelText;
  String? Function(String?)? validator;
  TextEditingController controller = TextEditingController();

  @override
  State<DefaultTextFiled> createState() => _DefaultTextFiledState();
}

class _DefaultTextFiledState extends State<DefaultTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFF6C7278),
            ),
          ),
          TextFormField(
            validator: widget.validator,
            controller: widget.controller,
            obscureText: widget.isPassword && !widget.showPassword,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              suffixIcon: widget.isPassword
                  ? widget.showPassword
                        ? IconButton(
                            onPressed: () {
                              widget.showPassword = !widget.showPassword;
                              setState(() {});
                            },
                            icon: Icon(Icons.visibility_off),
                          )
                        : IconButton(
                            onPressed: () {
                              widget.showPassword = !widget.showPassword;
                              setState(() {});
                            },
                            icon: Icon(Icons.remove_red_eye),
                          )
                  : null,
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
