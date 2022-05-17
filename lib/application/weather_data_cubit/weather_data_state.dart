part of 'weather_data_cubit.dart';

@immutable
abstract class WeatherDataState {}

class WeatherDataInitial extends WeatherDataState {}

class WeatherDataLoading extends WeatherDataState {}

class WeatherDataLoaded extends WeatherDataState {
  late final WeatherInfo weatherInfo;

  WeatherDataLoaded({
    required this.weatherInfo,
  });
}

class WeatherDataError extends WeatherDataState {}
