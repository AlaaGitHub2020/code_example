import 'package:code_example/presentation/city_weather_info_prediction/widgets/city_weather_info_prediction_appbar.dart';
import 'package:code_example/presentation/city_weather_info_prediction/widgets/city_weather_info_prediction_body.dart';
import 'package:flutter/material.dart';

class CityWeatherInfoPredictionPage extends StatelessWidget {
  const CityWeatherInfoPredictionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const CityWeatherInfoPredictionAppbar(),
        body: const CityWeatherInfoPredictionBody(),
      ),
    );
  }
}
