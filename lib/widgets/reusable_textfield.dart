import 'package:flutter/material.dart';
import 'package:task/common/colors/lightmode_colors.dart';

Widget reusableTextfield(
    {required BuildContext context,
    required Size size,
    String? hintText,
    Icon? prefixIcon,
    Widget? suffixIcon,
    TextEditingController? controller,
    bool obscureText = false,
    TextInputType keyBoardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.none}) {
  return Container(
    decoration: BoxDecoration(
      color: LightModeColor.whiteColor,
      borderRadius: BorderRadius.circular(size.width / 40),
      boxShadow: [
        BoxShadow(
          color: LightModeColor.blueColor.withOpacity(0.2),
          spreadRadius: 10,
          blurRadius: 10,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: TextFormField(
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: keyBoardType,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
            horizontal: size.width / 30, vertical: size.width / 30),
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width / 40),
          borderSide: const BorderSide(width: 0.5, color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width / 40),
          borderSide:
              const BorderSide(width: 0.5, color: LightModeColor.blueColor),
        ),
      ),
      obscureText: obscureText,
    ),
  );
}
