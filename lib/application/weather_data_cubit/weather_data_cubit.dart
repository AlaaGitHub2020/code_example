import 'package:bloc/bloc.dart';
import 'package:code_example/data/modules/weather_info.dart';
import 'package:code_example/data/repository/api/city_weather_data_repository.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:meta/meta.dart';

part 'weather_data_state.dart';

class WeatherDataCubit extends Cubit<WeatherDataState> {
  CityWeatherDataRepository weatherDataRepository;

  WeatherDataCubit({
    required this.weatherDataRepository,
  }) : super(WeatherDataInitial());

  final log = getLogger();

  getCurrentState() {
    return state;
  }

  changeCurrentState({required WeatherDataState weatherDataState}) {
    emit(weatherDataState);
  }

  fetchCityWeatherData({required String city}) async {
    log.i("fetchWeatherData Started");
    try {
      emit(WeatherDataLoading());
      WeatherInfo? weatherInfoResponse =
          await weatherDataRepository.getWeatherData(city: city);
      log.i("weatherInfoResponse $weatherInfoResponse");
      log.i("weatherInfoResponse.mainInfo ${weatherInfoResponse.mainInfo}");
      emit(WeatherDataLoaded(weatherInfo: weatherInfoResponse));
    } catch (e, s) {
      emit(WeatherDataError());
      log.e("Error $e $s");
    }
  }
}
