import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friflex_test/data/local_data/local_helper.dart';
import 'package:friflex_test/generated/l10n.dart';
import 'package:friflex_test/logic/blocs/cubits/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:friflex_test/logic/logger/simple_log_printer.dart';
import 'package:friflex_test/presentation/screens/first_screen/first_screen.dart';
import 'package:friflex_test/presentation/screens/no_connection_screen/no_connection_screen.dart';
import 'package:friflex_test/presentation/screens/second_screen/second_screen.dart';
import 'package:friflex_test/presentation/screens/third_screen/third_screen.dart';
import 'package:friflex_test/presentation/widgets/snackbars.dart';
import 'package:google_fonts/google_fonts.dart';

final log = getLogger();

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    log.i(
        "settings.name : ${settings.name}  | ScreenArguments: ${settings.arguments} ");

    Widget child;
    switch (settings.name) {
      case FirstScreen.routeName:
        {
          child = const FirstScreen();
          break;
        }
      case SecondScreen.routeName:
        {
          child = const SecondScreen();
          break;
        }
      case ThirdScreen.routeName:
        {
          child = const ThirdScreen();
          break;
        }
      case NoConnectionScreen.routeName:
        {
          child = const NoConnectionScreen();
          break;
        }

      default:
        child = Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Text(
              S.current.noRoute + '${settings.name}',
              style: GoogleFonts.montserrat(
                color: Colors.red,
                fontSize: LocalHelper.getFontSize(14),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        break;
    }

    return MaterialPageRoute(
        settings: settings, builder: (_) => applyFixedScaleFactor(child));
  }

  static onInternetError(
      InternetConnectionState internetConnectionState, BuildContext context) {
    if (internetConnectionState is InternetConnectionDisconnected) {
      log.i("Internet Disconnected");
      SnackBars.showError(context, S.of(context).noInternetConnection);
    }
    if (internetConnectionState is InternetConnectionConnected) {
      log.i("Internet Connected");
      SnackBars.showSuccess(context, S.of(context).internetConnectionBack);
    }
  }

  static Widget applyFixedScaleFactor(Widget child) {
    return Builder(
      builder: (BuildContext context) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1),
          child: BlocListener<InternetConnectionCubit, InternetConnectionState>(
            listener: (context, internetConnectionState) {
              onInternetError(internetConnectionState, context);
            },
            child:
                BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
              builder: (context, internetConnectionState) {
                if (internetConnectionState is InternetConnectionLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (internetConnectionState is InternetConnectionDisconnected) {
                  return const NoConnectionScreen();
                }
                if (internetConnectionState is InternetConnectionConnected) {
                  return child;
                }
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
