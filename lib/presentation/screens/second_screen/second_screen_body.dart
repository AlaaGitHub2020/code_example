import 'package:code_example/data/local_data/app_theme.dart';
import 'package:code_example/data/local_data/local_helper.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:code_example/logic/blocs/cubits/weather_data_cubit/weather_data_cubit.dart';
import 'package:code_example/logic/logger/simple_log_printer.dart';
import 'package:code_example/presentation/widgets/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SecondScreenBody extends StatefulWidget {
  const SecondScreenBody({Key? key}) : super(key: key);

  @override
  State<SecondScreenBody> createState() => _SecondScreenBodyState();
}

class _SecondScreenBodyState extends State<SecondScreenBody> {
  final log = getLogger();

  onErrorWeatherData(WeatherDataState state) {
    log.i("onErrorWeatherData Started");
    if (state is WeatherDataError) {
      SnackBars.showDefaultError(context);
    } else if (state is WeatherDataLoaded) {
      //todo: do something with the success fetching
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeatherDataCubit, WeatherDataState>(
      listener: (context, state) {
        onErrorWeatherData(state);
      },
      child: BlocBuilder<WeatherDataCubit, WeatherDataState>(
        builder: (context, state) {
          if (state is WeatherDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WeatherDataError) {
            return buildDataRetrievalErrorText(context);
          }
          if (state is WeatherDataLoaded) {
            return buildCityWeatherInfo(context, state);
          }
          return Container();
        },
      ),
    );
  }

  Container buildCityWeatherInfo(
      BuildContext context, WeatherDataLoaded state) {
    return Container(
      alignment: Alignment.center,
      height: 50.h,
      child: ListTile(
        contentPadding: EdgeInsets.all(5.w),
        leading: buildCityText(context, state),
        title: buildTemperature(context, state),
        subtitle: buildHumidity(context, state),
        trailing: buildWindSpeed(context, state),
      ),
    );
  }

  Text buildWindSpeed(BuildContext context, WeatherDataLoaded state) {
    return Text(
      S.of(context).windSpeed + state.weatherInfo.wind!.speed.toString(),
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
    );
  }

  Text buildHumidity(BuildContext context, WeatherDataLoaded state) {
    return Text(
      S.of(context).humidity + state.weatherInfo.mainInfo!.humidity.toString(),
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
    );
  }

  Text buildTemperature(BuildContext context, WeatherDataLoaded state) {
    return Text(
      S.of(context).temperature + state.weatherInfo.mainInfo!.temp.toString(),
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
    );
  }

  Text buildCityText(BuildContext context, WeatherDataLoaded state) {
    return Text(
      S.of(context).yourCity + state.weatherInfo.name!,
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
    );
  }

  Center buildDataRetrievalErrorText(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).dataRetrievalError,
        style: GoogleFonts.montserrat(
          color: Theme.of(context).errorColor,
          fontSize: LocalHelper.getFontSize(20),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
