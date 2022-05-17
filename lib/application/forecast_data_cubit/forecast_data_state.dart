part of 'forecast_data_cubit.dart';

@immutable
abstract class ForecastDataState {}

class ForecastDataInitial extends ForecastDataState {}

class ForecastDataLoading extends ForecastDataState {}

class ForecastDataLoaded extends ForecastDataState {
  late final Forecast forecastInfo;

  ForecastDataLoaded({
    required this.forecastInfo,
  });
}

class ForecastDataError extends ForecastDataState {}
