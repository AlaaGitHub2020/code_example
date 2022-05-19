import 'package:code_example/domain/core/utilities/config.dart';
import 'package:code_example/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:code_example/presentation/core/app_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';

final log = getLogger();

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  addFontLicense();
  prepareTheLogger();
  serverSetup();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const AppWidget(),
    ),
  );
  FlutterNativeSplash.remove();
}

void addFontLicense() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}

void prepareTheLogger() {
  if (kReleaseMode) {
    Logger.level = Level.info;
  } else {
    Logger.level = Level.debug;
  }
}

serverSetup() async {
  try {
    await Config().load();
  } catch (e) {
    log.e("Error from main function:$e");
  }
}
