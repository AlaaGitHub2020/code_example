import 'package:code_example/application/forecast_data_cubit/forecast_data_cubit.dart';
import 'package:code_example/data/local_data/local_helper.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:code_example/presentation/core/snackbars.dart';
import 'package:code_example/presentation/core/widgets/city_3_days_forecast_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class City3DaysForecastInfoBody extends StatefulWidget {
  const City3DaysForecastInfoBody({Key? key}) : super(key: key);

  @override
  _City3DaysForecastInfoBodyState createState() =>
      _City3DaysForecastInfoBodyState();
}

class _City3DaysForecastInfoBodyState extends State<City3DaysForecastInfoBody> {
  final log = getLogger();

  onErrorFetchingData(ForecastDataState state) {
    log.i("onErrorFetchingData Started");
    if (state is ForecastDataError) {
      SnackBars.showDefaultError(context);
    } else if (state is ForecastDataLoaded) {
      //todo: do something with the success fetching
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForecastDataCubit, ForecastDataState>(
      listener: (context, state) {
        onErrorFetchingData(state);
      },
      child: BlocBuilder<ForecastDataCubit, ForecastDataState>(
        builder: (context, forecastDataState) {
          if (forecastDataState is ForecastDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (forecastDataState is ForecastDataError) {
            return buildDataRetrievalErrorText(context);
          }
          if (forecastDataState is ForecastDataLoaded) {
            return buildCity3DaysForecastInfoList(forecastDataState);
          }
          return Container();
        },
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

  Center buildCity3DaysForecastInfoList(ForecastDataLoaded forecastDataState) {
    return Center(
      child: ListView.builder(
        // itemCount: forecastDataState.forecastInfo.daily.length,
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          for (int x = 0;
              x < forecastDataState.forecastInfo.daily!.length;
              x++) {
            forecastDataState.forecastInfo.daily!.sort((a, b) {
              return a!.temp!.day!.compareTo(b!.temp!.day!);
            });
          }
          return City3DaysForecastInfo(
            dailyData: forecastDataState.forecastInfo.daily![index],
          );
        },
      ),
    );
  }
}
