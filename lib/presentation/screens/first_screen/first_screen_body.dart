import 'package:flutter/material.dart';
import 'package:friflex_test/data/local_data/strings.dart';
import 'package:friflex_test/generated/l10n.dart';
import 'package:friflex_test/logic/blocs/cubits/weather_data_cubit/weather_data_cubit.dart';
import 'package:friflex_test/logic/logger/simple_log_printer.dart';
import 'package:friflex_test/presentation/screens/second_screen/second_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_test/data/local_data/app_theme.dart';
import 'package:friflex_test/presentation/widgets/custom_navigation_button.dart';
import 'package:friflex_test/presentation/widgets/custom_text_field.dart';

class FirstScreenBody extends StatefulWidget {
  const FirstScreenBody({Key? key}) : super(key: key);

  @override
  State<FirstScreenBody> createState() => _FirstScreenBodyState();
}

class _FirstScreenBodyState extends State<FirstScreenBody> {
  final TextEditingController? cityNameController = TextEditingController();
  final log = getLogger();

  getCityWeatherData() {
    context
        .read<WeatherDataCubit>()
        .fetchCityWeatherData(city: cityNameController!.text);
  }

  onPressedConfirm() {
    log.i("onPressedConfirm Started");
    if (cityNameController!.text.isNotEmpty) {
      getCityWeatherData();
      Navigator.of(context).pushNamed(SecondScreen.routeName);
      cityNameController!.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildCityName(context),
        buildConfirmBtn(context),
      ],
    );
  }

  CustomNavigationButton buildConfirmBtn(BuildContext context) {
    return CustomNavigationButton(
      heroTag: Strings.tBtnNav,
      onPressed: onPressedConfirm,
      text: S.of(context).confirm,
      margin: EdgeInsets.all(5.w),
      textColor: Theme.of(context).confirmBtnTextColor,
    );
  }

  CustomTextField buildCityName(BuildContext context) {
    return CustomTextField(
      controller: cityNameController,
      hintText: S.of(context).enterCityName,
    );
  }
}
