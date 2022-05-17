part of 'internet_connection_cubit.dart';

@immutable
abstract class InternetConnectionState {}

class InternetConnectionLoading extends InternetConnectionState {}

class InternetConnectionConnected extends InternetConnectionState {}

class InternetConnectionDisconnected extends InternetConnectionState {}
