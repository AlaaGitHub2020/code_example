import 'package:flutter/material.dart';
import 'package:friflex_test/logic/utilities/colors.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    backgroundColor: AppColors.lightModeBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    errorColor: AppColors.lightErrorColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: AppColors.darkModeBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    errorColor: AppColors.darkErrorColor,
    iconTheme: const IconThemeData(
      color: Colors.white38,
    ),
  );

  static ThemeData light() {
    return lightTheme;
  }

  static ThemeData dark() {
    return darkTheme;
  }
}

extension ThemeExtras on ThemeData {
  Color get btnColor => brightness == Brightness.light
      ? AppColors.lightBtnColor
      : AppColors.darkBtnColor;

  Color get textFieldTextColor => brightness == Brightness.light
      ? AppColors.lightTextFieldTextColor
      : AppColors.darkTextFieldTextColor;

  Color get textFieldBorderColor => brightness == Brightness.light
      ? AppColors.lightTextFieldBorderColor
      : AppColors.darkTextFieldBorderColor;

  Color get btnNavigationBackgroundColor => brightness == Brightness.light
      ? AppColors.lightBtnNavigationBackgroundColor
      : AppColors.darkBtnNavigationBackgroundColor;

  Color get btnNavigationTextColor => brightness == Brightness.light
      ? AppColors.lightBtnNavigationTextColor
      : AppColors.darkBtnNavigationTextColor;

  Color get confirmBtnTextColor => brightness == Brightness.light
      ? AppColors.lightConfirmBtnTextColor
      : AppColors.darkConfirmBtnTextColor;

  Color get appBarBackgroundColor => brightness == Brightness.light
      ? AppColors.lightAppBarBackgroundColor
      : AppColors.darkAappBarBackgroundColor;
}
