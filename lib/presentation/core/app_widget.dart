import 'package:code_example/application/forecast_data_cubit/forecast_data_cubit.dart';
import 'package:code_example/application/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:code_example/application/theme_cubit/theme_cubit.dart';
import 'package:code_example/application/weather_data_cubit/weather_data_cubit.dart';
import 'package:code_example/data/local_data/strings.dart';
import 'package:code_example/data/repository/api/api_repository.dart';
import 'package:code_example/data/repository/api/city_forecast_data_repository.dart';
import 'package:code_example/data/repository/api/city_weather_data_repository.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:code_example/presentation/routes/router.gr.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

final APIRepository apiRepository = APIRepository();
final CityWeatherDataRepository cityWeatherDataRepository =
    CityWeatherDataRepository(apiRepository);
final CityForecastDataRepository cityForecastDataRepository =
    CityForecastDataRepository(apiRepository);

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CityWeatherDataRepository>(
            create: (context) => CityWeatherDataRepository(apiRepository)),
        RepositoryProvider<CityForecastDataRepository>(
            create: (context) => CityForecastDataRepository(apiRepository)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit(),
          ),
          BlocProvider<InternetConnectionCubit>(
            create: (BuildContext context) => InternetConnectionCubit(),
          ),
          BlocProvider<WeatherDataCubit>(
            create: (BuildContext context) => WeatherDataCubit(
                weatherDataRepository: cityWeatherDataRepository),
          ),
          BlocProvider<ForecastDataCubit>(
            create: (BuildContext context) => ForecastDataCubit(
                cityForecastDataRepository: cityForecastDataRepository),
          ),
        ],
        child: const WitherPredictionCodeExample(),
      ),
    );
  }
}

class WitherPredictionCodeExample extends StatefulWidget {
  const WitherPredictionCodeExample({Key? key}) : super(key: key);

  @override
  State<WitherPredictionCodeExample> createState() =>
      _WitherPredictionCodeExampleState();
}

class _WitherPredictionCodeExampleState
    extends State<WitherPredictionCodeExample> {
  Locale? _locale;
  final _appRouter = AppRouter();

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: kReleaseMode ? _locale : DevicePreview.locale(context),
        title: Strings.appTitle,
        theme: context.watch<ThemeCubit>().state.theme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return locale;
            }
          }
          return null;
        },
      );
    });
  }
}
