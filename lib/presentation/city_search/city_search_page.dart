import 'package:code_example/presentation/city_search/widgets/city_search_body.dart';
import 'package:flutter/material.dart';

class CitySearchPage extends StatelessWidget {
  const CitySearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: const CitySearchBody(),
      ),
    );
  }
}
