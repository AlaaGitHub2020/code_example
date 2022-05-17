import 'package:code_example/presentation/screens/first_screen/first_screen_body.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const routeName = '/';

  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: const FirstScreenBody(),
      ),
    );
  }
}
