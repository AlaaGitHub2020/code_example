import 'package:flutter/material.dart';
import 'package:friflex_test/data/modules/daily.dart';
import 'package:friflex_test/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:friflex_test/data/local_data/app_theme.dart';

class City3DaysForecastInfo extends StatelessWidget {
  final Daily? dailyData;

  const City3DaysForecastInfo({
    Key? key,
    required this.dailyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: buildMainWeather(context),
      title: buildTemperature(context),
      subtitle: buildHumidity(context),
      trailing: buildWindSpeed(context),
    );
  }

  Text buildWindSpeed(BuildContext context) {
    return Text(
      S.of(context).windSpeed + dailyData!.windSpeed.toString(),
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
    );
  }

  Text buildHumidity(BuildContext context) {
    return Text(
      S.of(context).humidity + dailyData!.humidity.toString(),
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Text buildTemperature(BuildContext context) {
    return Text(
      S.of(context).tempInDay + dailyData!.temp!.day.toString(),
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Text buildMainWeather(BuildContext context) {
    return Text(
      S.of(context).mainWeather + dailyData!.weather[0]!.main!,
      style: GoogleFonts.montserrat(
        color: Theme.of(context).confirmBtnTextColor,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
