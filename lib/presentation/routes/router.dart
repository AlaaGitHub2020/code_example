import 'package:auto_route/annotations.dart';
import 'package:code_example/presentation/city_3_days_forecast_info/city_3_days_forecast_info_page.dart';
import 'package:code_example/presentation/city_search/city_search_page.dart';
import 'package:code_example/presentation/city_weather_info_prediction/city_weather_info_prediction_page.dart';
import 'package:code_example/presentation/no_connection/no_connection_page.dart';
import 'package:code_example/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPage, initial: true),
    AutoRoute(page: CitySearchPage),
    AutoRoute(page: CityWeatherInfoPredictionPage),
    AutoRoute(page: City3DaysForecastInfoPage),
    AutoRoute(page: NoConnectionPage),
  ],
)
class $AppRouter {}
