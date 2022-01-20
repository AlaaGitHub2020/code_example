import 'package:flutter/material.dart';
import 'package:friflex_test/data/local_data/local_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:friflex_test/data/local_data/app_theme.dart';

class CustomNavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String heroTag;
  final EdgeInsets? margin;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool? btnDisabled;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? height;

  const CustomNavigationButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.heroTag,
      this.margin,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.btnDisabled = false,
      this.backgroundColor,
      this.borderColor,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Container(
        width: 100.w,
        height: height ?? 7.18.h,
        margin: margin,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            side: borderColor != null
                ? MaterialStateProperty.all(BorderSide(color: borderColor!))
                : null,
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? Theme.of(context).btnNavigationBackgroundColor,
            ),
          ),
          onPressed: btnDisabled!
              ? null
              : () {
                  onPressed();
                },
          child: buildBtnText(context),
        ),
      ),
    );
  }

  Text buildBtnText(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: LocalHelper.getFontSize(fontSize ?? 20),
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: textColor ?? Theme.of(context).btnNavigationTextColor,
      ),
    );
  }
}
