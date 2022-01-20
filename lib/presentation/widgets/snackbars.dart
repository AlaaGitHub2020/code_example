import 'package:flutter/material.dart';
import 'package:friflex_test/generated/l10n.dart';
import 'package:friflex_test/presentation/widgets/custom_snackbar.dart';

class SnackBars {
  static showSuccess(BuildContext context, String text) {
    SnackBar snackBar = CustomSnackBar(
      context: context,
      backgroundColor: Colors.green,
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
      backgroundColor: Colors.red,
      text: text,
    );
    showSnackBar(context, snackBar);
  }

  static showSnackBar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
