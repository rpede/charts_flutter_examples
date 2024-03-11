/// Line chart example
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class AreaAndLineChart extends StatelessWidget {
  const AreaAndLineChart({super.key});

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
          )
            // Configure our custom bar target renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customArea'),
          charts.Series<LinearSales, int>(
            id: 'Tablet',
            colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
            domainFn: (LinearSales sales, _) => sales.year,
            measureFn: (LinearSales sales, _) => sales.sales,
            data: myFakeTabletData,
          ),
        ],
        animate: true,
        customSeriesRenderers: [
          charts.LineRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customArea',
              includeArea: true,
              stacked: true),
        ]);
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

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
