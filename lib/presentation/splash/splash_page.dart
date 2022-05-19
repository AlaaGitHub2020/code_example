import 'package:auto_route/auto_route.dart';
import 'package:code_example/application/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:code_example/domain/core/utilities/colors.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:code_example/presentation/core/snackbars.dart';
import 'package:code_example/presentation/no_connection/no_connection_page.dart';
import 'package:code_example/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final log = getLogger();

  navigate() async {
    await Future.delayed(const Duration(seconds: 3))
        .whenComplete(() => context.router.push(const CitySearchRoute()));
  }

  onInternetError(
      InternetConnectionState internetConnectionState, BuildContext context) {
    if (internetConnectionState is InternetConnectionDisconnected) {
      log.i("Internet Disconnected");
      SnackBars.showError(context, S.current.noInternetConnection);
    }
    if (internetConnectionState is InternetConnectionConnected) {
      log.i("Internet Connected");
    }
  }

  @override
  void initState() {
    super.initState();
    navigate();
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
                return Container(
                  color: AppColors.backgroundColorBlue,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
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
    return const SafeArea(
      child: Scaffold(
        body: RiveAnimation.asset('assets/splash.riv', fit: BoxFit.cover),
      ),
    );
  }
}
