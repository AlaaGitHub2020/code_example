import 'package:bloc/bloc.dart';
import 'package:code_example/data/local_data/app_theme.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<AppThemeState> {
  ThemeCubit() : super(LightThemeState());

  toggleDarkMode() {
    if (state is LightThemeState) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }
}
