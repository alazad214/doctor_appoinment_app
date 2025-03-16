import 'package:flutter/material.dart';

import 'app_colors.dart';

Widget customButton(
    {required String name,
    required VoidCallback onCallBack,
    double? height,
    double? minWidth,
    double? borderRadius,
    Color? color,
    padding,
    TextStyle? textStyle,
    required BuildContext context,
    Color? borderColor,
    elevation}) {
  return GestureDetector(
    onTap: onCallBack,
    child: Container(
      height: height ?? 48,
      width: minWidth ?? double.infinity,
      padding: padding ?? EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
          )),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: textStyle ??
            TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
      ),
    ),
  );
}
