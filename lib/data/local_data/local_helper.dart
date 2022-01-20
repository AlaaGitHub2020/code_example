import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friflex_test/logic/logger/simple_log_printer.dart';
import 'package:friflex_test/logic/utilities/config.dart';
import 'package:logger/logger.dart';
import 'package:sizer/sizer.dart';

abstract class LocalHelper {
  static final log = getLogger();

  static addFontLicense() {
    LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    });
  }

  static Future<void> appConfigurationSetup() async {
    WidgetsFlutterBinding.ensureInitialized();
    if (kReleaseMode) {
      Logger.level = Level.info;
    } else {
      Logger.level = Level.debug;
    }
    addFontLicense();
  }

  static Future<void> serverSetup() async {
    try {
      await Config().load();
    } catch (e) {
      log.e("Error from main function:$e");
    }
  }

  static double getFontSize(double? fontSize) {
    fontSize = ((fontSize! * 30.0) / 35.0).sp;
    return fontSize;
  }
}
