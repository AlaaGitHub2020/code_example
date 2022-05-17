import 'package:code_example/presentation/screens/second_screen/second_screen_appbar.dart';
import 'package:code_example/presentation/screens/second_screen/second_screen_body.dart';
import 'package:flutter/material.dart';

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
