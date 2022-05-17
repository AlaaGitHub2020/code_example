import 'dart:io';

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
  FlutterNativeSplash.removeAfter(initialization);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const AppWidget(),
    ),
  );
}

Future<void> initialization(BuildContext context) async {
  if (Platform.isAndroid || Platform.isIOS) {
    WidgetsFlutterBinding.ensureInitialized();
    addFontLicense();
    prepareTheLogger();
    serverSetup();
  } else if (kIsWeb) {
  } else if (Platform.isWindows) {
  } else {}
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
