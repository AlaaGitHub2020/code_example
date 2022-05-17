import 'package:code_example/presentation/city_3_days_forecast_info/widgets/city_3_days_forecast_info_body.dart';
import 'package:flutter/material.dart';

class City3DaysForecastInfoPage extends StatelessWidget {
  static const routeName = '/ThirdScreen';
  const City3DaysForecastInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: const City3DaysForecastInfoBody(),
      ),
    );
  }
}
