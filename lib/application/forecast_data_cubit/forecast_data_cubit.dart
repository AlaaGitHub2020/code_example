import 'package:bloc/bloc.dart';
import 'package:code_example/data/modules/forecast.dart';
import 'package:code_example/data/repository/api/city_forecast_data_repository.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:meta/meta.dart';

part 'forecast_data_state.dart';

class ForecastDataCubit extends Cubit<ForecastDataState> {
  CityForecastDataRepository cityForecastDataRepository;
  ForecastDataCubit({
    required this.cityForecastDataRepository,
  }) : super(ForecastDataInitial());

  final log = getLogger();

  fetchCityForecast(
      {required String latitude, required String longitude}) async {
    log.i("fetchCityForecast Started");
    try {
      emit(ForecastDataLoading());
      Forecast forecastInfoResponse = await cityForecastDataRepository
          .getForecast(latitude: latitude, longitude: longitude);
      log.i("forecastInfoResponse $forecastInfoResponse");
      log.i("forecastInfoResponse.daily ${forecastInfoResponse.daily}");
      emit(ForecastDataLoaded(forecastInfo: forecastInfoResponse));
    } catch (e, s) {
      emit(ForecastDataError());
      log.e("Error $e $s");
    }
  }
}
