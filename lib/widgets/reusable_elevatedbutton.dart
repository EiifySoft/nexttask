import 'package:flutter/material.dart';
import 'package:task/common/colors/index.dart';
import 'package:task/common/style/index.dart';

Widget reusableElevatedButton({
  required Size size,
  String? lable,
  Color lableColor = LightModeColor.whiteColor,
  Color backgroundColor = LightModeColor.blueColor,
  required VoidCallback onPressed,
}) {
  return Container(
    height: size.width / 8,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width / 40),
        boxShadow: [
          BoxShadow(
            color: LightModeColor.blueColor.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ]),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.width / 40),
        ),
      ),
      child: AppTextStyle.reusableText16(
        text: lable!,
        textColor: lableColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
