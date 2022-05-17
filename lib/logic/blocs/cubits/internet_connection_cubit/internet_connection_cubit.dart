import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:code_example/logic/logger/simple_log_printer.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  late final StreamSubscription<InternetConnectionStatus> listener;

  InternetConnectionCubit() : super(InternetConnectionLoading()) {
    checkInternetConnection();
    monitorInternetConnection();
  }

  final log = getLogger();

  checkInternetConnection() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;

    log.i(
      isConnected.toString(),
    );
    if (isConnected) {
      emit(InternetConnectionConnected());
    } else {
      emit(InternetConnectionDisconnected());
    }
  }

  monitorInternetConnection() {
    listener = InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            log.i('Data connection is available.');
            emit(InternetConnectionConnected());
            break;
          case InternetConnectionStatus.disconnected:
            log.i('You are disconnected from the internet.');
            emit(InternetConnectionDisconnected());
            break;
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await Future<void>.delayed(const Duration(seconds: 10));
    listener.cancel();
    return super.close();
  }
}
