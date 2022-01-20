import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:friflex_test/data/local_data/local_helper.dart';
import 'package:friflex_test/data/local_data/strings.dart';
import 'package:friflex_test/data/repository/api/api_repository.dart';
import 'package:friflex_test/data/repository/api/city_forecast_data_repository.dart';
import 'package:friflex_test/data/repository/api/city_weather_data_repository.dart';
import 'package:friflex_test/generated/l10n.dart';
import 'package:friflex_test/logic/blocs/cubits/forecast_data_cubit/forecast_data_cubit.dart';
import 'package:friflex_test/logic/blocs/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:friflex_test/logic/blocs/cubits/theme_cubit/theme_cubit.dart';
import 'package:friflex_test/logic/blocs/cubits/weather_data_cubit/weather_data_cubit.dart';
import 'package:friflex_test/logic/logger/simple_log_printer.dart';
import 'package:friflex_test/routes.dart';
import 'package:sizer/sizer.dart';

import 'logic/blocs/cubits/internet_connection_cubit/internet_connection_cubit.dart';

//todo : please note this : I'll not add the comments to explain the code because I'm sure my code is clear even for junior developer to understand it
//todo :  I tried to make it clear and readable as much as possible in the frame time you give to me

final log = getLogger();

final APIRepository apiRepository = APIRepository();
final CityWeatherDataRepository cityWeatherDataRepository =
    CityWeatherDataRepository(apiRepository);
final CityForecastDataRepository cityForecastDataRepository =
    CityForecastDataRepository(apiRepository);

void main() async {
  await LocalHelper.appConfigurationSetup();
  await LocalHelper.serverSetup();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        child: const FriFlex(),
      ),
    );
  }
}

class FriFlex extends StatefulWidget {
  const FriFlex({Key? key}) : super(key: key);

  @override
  State<FriFlex> createState() => _FriFlexState();
}

class _FriFlexState extends State<FriFlex> {
  final heroController = HeroController();
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: kReleaseMode ? _locale : DevicePreview.locale(context),
        title: Strings.appTitle,
        theme: context.watch<ThemeCubit>().state.theme,
        onGenerateRoute: Routes.generateRoute,
        supportedLocales: S.delegate.supportedLocales,
        navigatorObservers: [heroController],
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // ignore: missing_return
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return locale;
            }
          }
        },
      );
    });
  }
}
