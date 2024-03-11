/// Example of a stacked area chart.
library;

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class StackedAreaLineChart extends StatelessWidget {
  const StackedAreaLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      [
        charts.Series<LinearSales, int>(
          id: 'Desktop',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeDesktopData,
        ),
        charts.Series<LinearSales, int>(
          id: 'Tablet',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeTabletData,
        ),
        charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeMobileData,
        ),
      ],
      defaultRenderer:
          charts.LineRendererConfig(includeArea: true, stacked: true),
      animate: true,
    );
  }
}

final myFakeDesktopData = [
  LinearSales(0, 5),
  LinearSales(1, 25),
  LinearSales(2, 100),
  LinearSales(3, 75),
];

var myFakeTabletData = [
  LinearSales(0, 10),
  LinearSales(1, 50),
  LinearSales(2, 200),
  LinearSales(3, 150),
];

var myFakeMobileData = [
  LinearSales(0, 15),
  LinearSales(1, 75),
  LinearSales(2, 300),
  LinearSales(3, 225),
];

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
