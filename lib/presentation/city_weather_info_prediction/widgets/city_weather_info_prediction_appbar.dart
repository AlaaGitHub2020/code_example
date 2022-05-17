import 'package:auto_route/auto_route.dart';
import 'package:code_example/application/forecast_data_cubit/forecast_data_cubit.dart';
import 'package:code_example/application/weather_data_cubit/weather_data_cubit.dart';
import 'package:code_example/data/local_data/app_theme.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:code_example/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityWeatherInfoPredictionAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  const CityWeatherInfoPredictionAppbar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CityWeatherInfoPredictionAppbarState createState() =>
      _CityWeatherInfoPredictionAppbarState();
}

class _CityWeatherInfoPredictionAppbarState
    extends State<CityWeatherInfoPredictionAppbar> {
  final log = getLogger();

  onPressedWitherInfo(WeatherDataState weatherDataState) {
    log.i("onPressedWitherInfo Started");
    if (weatherDataState is WeatherDataLoaded) {
      context.read<ForecastDataCubit>().fetchCityForecast(
            latitude: weatherDataState.weatherInfo.coord!.lat.toString(),
            longitude: weatherDataState.weatherInfo.coord!.lon.toString(),
          );
      context.router.push(const City3DaysForecastInfoRoute());
    }
  }

  onPressedBack() {
    log.i("onPressedBack Started");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarBackgroundColor,
      leading: buildBackBtn(context),
      actions: [
        BlocBuilder<WeatherDataCubit, WeatherDataState>(
          builder: (context, weatherDataState) {
            if (weatherDataState is WeatherDataLoaded) {
              return buildFunctionalInfoBtn(weatherDataState, context);
            }
            return buildNonFunctionalInfoBtn(context);
          },
        ),
      ],
    );
  }

  IconButton buildBackBtn(BuildContext context) {
    return IconButton(
      onPressed: onPressedBack,
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }

  IconButton buildNonFunctionalInfoBtn(BuildContext context) {
    return IconButton(
      onPressed: null,
      icon: buildIcon(context),
    );
  }

  IconButton buildFunctionalInfoBtn(
      WeatherDataLoaded weatherDataState, BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressedWitherInfo(weatherDataState);
      },
      icon: buildIcon(context),
    );
  }

  Icon buildIcon(BuildContext context) {
    return Icon(
      Icons.info_outline,
      color: Theme.of(context).iconTheme.color,
    );
  }
}
