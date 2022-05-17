import 'package:code_example/presentation/screens/third_screen/third_screen_body.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  static const routeName = '/ThirdScreen';
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: const ThirdScreenBody(),
      ),
    );
  }
}
