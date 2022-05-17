import 'package:code_example/data/local_data/app_theme.dart';
import 'package:code_example/generated/l10n.dart';
import 'package:code_example/presentation/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';

class SnackBars {
  static showSuccess(BuildContext context, String text) {
    SnackBar snackBar = CustomSnackBar(
      context: context,
      backgroundColor: Theme.of(context).successColor,
      icon: const Icon(Icons.thumb_up),
      text: text,
    );
    showSnackBar(context, snackBar);
  }

  static showDefaultError(BuildContext context) {
    showError(context, S.of(context).genericError);
  }

  static showError(BuildContext context, String text) {
    SnackBar snackBar = CustomSnackBar(
      context: context,
      icon: const Icon(Icons.error),
      backgroundColor: Theme.of(context).errorColor,
      text: text,
    );
    showSnackBar(context, snackBar);
  }

  static showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
