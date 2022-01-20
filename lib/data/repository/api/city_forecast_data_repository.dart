import 'package:dio/dio.dart';
import 'package:friflex_test/data/local_data/strings.dart';
import 'package:friflex_test/data/modules/forecast.dart';
import 'package:friflex_test/logic/logger/simple_log_printer.dart';
import 'api_repository.dart';

class CityForecastDataRepository {
  final APIRepository _apiRepository;
  final log = getLogger();

  CityForecastDataRepository(this._apiRepository);

  Future<Forecast> getForecast(
      {required String latitude, required String longitude}) async {
    Response response = await _apiRepository.get(
      'onecall',
      queryParameters: {
        "lat": latitude,
        "lon": longitude,
        "APPID": Strings.cAppKey
      },
    );
    log.i("response.data :${response.data}");
    log.i("response.statusCode :${response.statusCode}");
    return Forecast.fromJson(response.data);
  }
}
