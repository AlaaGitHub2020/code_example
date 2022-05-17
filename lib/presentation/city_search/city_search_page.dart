import 'package:code_example/application/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:code_example/presentation/city_search/widgets/city_search_body.dart';
import 'package:code_example/presentation/core/snackbars.dart';
import 'package:code_example/presentation/no_connection/no_connection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySearch extends StatefulWidget {
  const CitySearch({
    Key? key,
  }) : super(key: key);

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  final log = getLogger();

  onInternetError(
      InternetConnectionState internetConnectionState, BuildContext context) {
    if (internetConnectionState is InternetConnectionDisconnected) {
      log.i("Internet Disconnected");
      SnackBars.showError(context, S.current.noInternetConnection);
    }
    if (internetConnectionState is InternetConnectionConnected) {
      log.i("Internet Connected");
      SnackBars.showSuccess(context, S.current.internetConnectionBack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return BlocListener<InternetConnectionCubit, InternetConnectionState>(
          listener: (context, internetConnectionState) {
            onInternetError(internetConnectionState, context);
          },
          child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
            builder: (context, internetConnectionState) {
              if (internetConnectionState is InternetConnectionLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (internetConnectionState is InternetConnectionDisconnected) {
                return const NoConnectionPage();
              }
              if (internetConnectionState is InternetConnectionConnected) {
                return buildSafeArea(context);
              }
              return Container();
            },
          ),
        );
      },
    );
  }

  SafeArea buildSafeArea(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: const CitySearchBody(),
      ),
    );
  }
}
