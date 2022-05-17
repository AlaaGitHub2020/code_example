import 'package:code_example/data/local_data/strings.dart';
import 'package:code_example/data/modules/weather_info.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:dio/dio.dart';

import 'api_repository.dart';

class CityWeatherDataRepository {
  late final APIRepository _apiRepository;
  late WeatherInfo _weatherInfo;

  CityWeatherDataRepository(this._apiRepository);

  final log = getLogger();

  Future<WeatherInfo> getWeatherData({required String city}) async {
    Response response = await _apiRepository.get(
      'weather',
      queryParameters: {"q": city, "APPID": Strings.cAppKey},
    );
    log.i("response.data :${response.data}");
    log.i("response.statusCode :${response.statusCode}");
    _weatherInfo = WeatherInfo.fromJson(response.data);
    return _weatherInfo;
  }

  get weatherInfo => _weatherInfo;
}
