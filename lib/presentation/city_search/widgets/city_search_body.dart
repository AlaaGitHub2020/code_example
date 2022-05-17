import 'package:auto_route/auto_route.dart';
import 'package:code_example/application/weather_data_cubit/weather_data_cubit.dart';
import 'package:code_example/data/local_data/app_theme.dart';
import 'package:code_example/data/local_data/strings.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:code_example/presentation/core/widgets/custom_navigation_button.dart';
import 'package:code_example/presentation/core/widgets/custom_text_field.dart';
import 'package:code_example/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CitySearchBody extends StatefulWidget {
  const CitySearchBody({Key? key}) : super(key: key);

  @override
  State<CitySearchBody> createState() => _CitySearchBodyState();
}

class _CitySearchBodyState extends State<CitySearchBody> {
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
      context.router.push(const CityWeatherInfoPredictionRoute());
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
