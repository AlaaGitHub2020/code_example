import 'package:code_example/data/local_data/local_helper.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoConnectionScreen extends StatelessWidget {
  static const routeName = '/NoConnectionScreen';

  const NoConnectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: buildNoInternetConnectionText(context),
      ),
    );
  }

  Center buildNoInternetConnectionText(BuildContext context) {
    return Center(
      child: Text(
        S.of(context).noInternetConnection,
        style: GoogleFonts.montserrat(
          color: Theme.of(context).errorColor,
          fontSize: LocalHelper.getFontSize(18),
        ),
      ),
    );
  }
}
