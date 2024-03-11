/// Example of a simple line chart.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  const SimpleLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      [
        charts.Series<LinearSales, int>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: data,
        )
      ],
      animate: true,
    );
  }
}

final data = [
  LinearSales(0, 5),
  LinearSales(1, 25),
  LinearSales(2, 100),
  LinearSales(3, 75),
];

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
