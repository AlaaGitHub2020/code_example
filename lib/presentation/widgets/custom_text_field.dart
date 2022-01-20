import 'package:flutter/material.dart';
import 'package:friflex_test/data/local_data/local_helper.dart';
import 'package:friflex_test/logic/utilities/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:friflex_test/data/local_data/app_theme.dart';

class CustomTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onEditingComplete;
  final TextStyle? style;
  final InputDecoration? decoration;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.validator,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.onEditingComplete,
    this.style,
    this.decoration,
    this.prefixIcon,
    this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: widget.padding ?? EdgeInsets.only(left: 5.55.w, right: 5.55.w),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          obscureText: widget.obscureText ?? false,
          validator: widget.validator,
          autovalidateMode: widget.autoValidateMode,
          textAlignVertical: TextAlignVertical.center,
          onEditingComplete: widget.onEditingComplete,
          onTap: widget.onTap,
          style: widget.style ??
              GoogleFonts.montserrat(
                color: Theme.of(context).textFieldTextColor,
                fontSize: LocalHelper.getFontSize(13),
                fontWeight: FontWeight.normal,
              ),
          decoration: widget.decoration ?? buildDefaultInputDecoration(),
        ),
      ),
    );
  }

  InputDecoration buildDefaultInputDecoration() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: AppColors.lightModeBackgroundColor,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      errorStyle: GoogleFonts.montserrat(
        fontSize: LocalHelper.getFontSize(8),
      ),
      contentPadding: EdgeInsets.only(
        left: 3.61.w,
      ),
      hintStyle: GoogleFonts.montserrat(
          color: Theme.of(context).textFieldTextColor,
          fontSize: LocalHelper.getFontSize(13)),
      hintText: widget.hintText,
      border: buildOutlineBorder(),
      focusedBorder: buildOutlineBorder(),
      enabledBorder: buildOutlineBorder(),
      errorBorder: buildOutlineBorder(),
      focusedErrorBorder: buildOutlineBorder(),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
        color: Theme.of(context).textFieldBorderColor,
        width: 1,
      ),
    );
  }
}
