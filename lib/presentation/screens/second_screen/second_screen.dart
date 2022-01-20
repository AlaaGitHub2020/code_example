import 'package:flutter/material.dart';
import 'package:friflex_test/presentation/screens/second_screen/second_screen_appbar.dart';
import 'package:friflex_test/presentation/screens/second_screen/second_screen_body.dart';

class SecondScreen extends StatelessWidget {
  static const routeName = '/SecondScreen';

  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: const SecondScreenAppbar(),
        body: const SecondScreenBody(),
      ),
    );
  }
}
