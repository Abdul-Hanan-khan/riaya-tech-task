import 'package:fit_journey/src/core/utils/app_fonts.dart';
import 'package:fit_journey/src/modules/cusotm_elements/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';


class CustomButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? buttonTextColor;
  final String buttonText;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback? onTap;
  final bool? showBorder;
  final Color? borderColor;
  final double? buttonTextSize;
  final Widget? leadingIcon;

  const CustomButton(
      {super.key,
      this.buttonColor,
      required this.buttonText,
      this.buttonTextColor,
      this.buttonTextSize,
      this.height,
      this.showBorder,
      this.borderColor,
      this.borderRadius,
      this.width,
      this.onTap,
      this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0.h, // Default height if not provided
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: showBorder ?? false
                  ? borderColor ?? AppColors.appThemeColor
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              buttonColor ?? Colors.blue,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius??0),
                    ))),
        child: CustomText(
          text: buttonText,
          textColor: buttonTextColor ?? AppColors.black,
          fontSize: buttonTextSize ?? 18,
          fontFamily: AppFonts.PoppinsBold,
        ),
      ),
    );
  }
}