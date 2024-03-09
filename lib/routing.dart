import 'package:charts_flutter_examples/examples/simple_time_series.dart';
import 'package:charts_flutter_examples/overview_page.dart';
import 'package:flutter/material.dart';

import 'example_page.dart';

final Map<String, Widget Function()> examples = {
  'simple_time_series': SimpleTimeSeriesChart.new,
};

final Map<String, ExampleDef> examplesExtended =
    examples.map((key, value) => MapEntry(key, (
          title: key.toTitle(),
          code: 'lib/examples/$key.dart',
          image: 'images/$key.png',
          builder: value,
        )));

final Map<String, Widget Function(BuildContext)> routes = {
  // When navigating to the "/" route, build the FirstScreen widget.
  '/': (context) => const OverviewPage(),
  // When navigating to the "/second" route, build the SecondScreen widget.
  // '/second': (context) => const SecondScreen(),
}..addAll(examplesExtended.map((key, value) =>
    MapEntry(key, (BuildContext context) => ExamplePage(value))));

typedef ExampleDef = ({
  String title,
  String code,
  String image,
  Widget Function() builder
});

extension StringX on String {
  String toTitle() {
    return split('_')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join(' ')
        .toString();
  }
}
