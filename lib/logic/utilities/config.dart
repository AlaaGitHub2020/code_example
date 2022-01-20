import 'package:flutter/services.dart';
import 'package:friflex_test/data/local_data/strings.dart';
import 'package:friflex_test/logic/logger/simple_log_printer.dart';
import "package:yaml/yaml.dart";

class Config {
  static YamlMap? _config;

  final log = getLogger();
  Future<void> load() async {
    if (_config == null) {
      final data = await rootBundle.loadString(Strings.cAppConfigFile);
      Config._config = loadYaml(data);
    } else {
      throw ("Config already loaded");
    }
  }

  String get(String key) {
    return Config._config!.value[key];
  }
}
