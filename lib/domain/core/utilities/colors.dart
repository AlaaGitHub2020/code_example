import 'package:code_example/domain/core/utilities/hex_colors.dart';
import 'package:flutter/material.dart';

///the app colors here
class AppColors {
  ///Dark Colors
  static final HexColor darkModeBackgroundColor = HexColor("#000000");
  static const MaterialColor darkErrorColor = Colors.red;
  static final HexColor darkBtnColor = HexColor("#123232");
  static final HexColor darkTextFieldTextColor = HexColor("#FFFFFF");
  static final HexColor darkTextFieldBorderColor = HexColor("#DDDDDD");
  static final HexColor darkBtnNavigationTextColor = HexColor("#DDDDDD");
  static final HexColor darkBtnNavigationBackgroundColor = HexColor("#DDDDDD");
  static const MaterialAccentColor darkConfirmBtnTextColor =
      Colors.deepPurpleAccent;
  static const MaterialAccentColor darkAappBarBackgroundColor =
      Colors.greenAccent;
  static const MaterialAccentColor darkSuccessColor = Colors.greenAccent;

  ///Light colors
  static final HexColor lightModeBackgroundColor = HexColor("#FFFFFF");
  static const MaterialAccentColor lightErrorColor = Colors.redAccent;
  static final HexColor lightBtnColor = HexColor("#AFDADF");
  static final HexColor lightTextFieldTextColor = HexColor("#000000");
  static final HexColor lightTextFieldBorderColor = HexColor("#CCCCCC");
  static final HexColor lightBtnNavigationTextColor = HexColor("#CCCCCC");
  static final HexColor lightBtnNavigationBackgroundColor = HexColor("#CCCCCC");
  static const MaterialColor lightConfirmBtnTextColor = Colors.deepPurple;
  static const MaterialColor lightAppBarBackgroundColor = Colors.green;
  static const MaterialColor lightSuccessColor = Colors.green;
}
