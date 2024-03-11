/// Example of a numeric combo chart with two series rendered as bars, and a
/// third rendered as a line.
library;

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class NumericComboLineBarChart extends StatelessWidget {
  const NumericComboLineBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.NumericComboChart(
        [
          charts.Series<LinearSales, int>(
            id: 'Desktop',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (LinearSales sales, _) => sales.year,
            measureFn: (LinearSales sales, _) => sales.sales,
            data: desktopSalesData,
          )
            // Configure our custom bar renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customBar'),
          charts.Series<LinearSales, int>(
            id: 'Tablet',
            colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
            domainFn: (LinearSales sales, _) => sales.year,
            measureFn: (LinearSales sales, _) => sales.sales,
            data: tableSalesData,
          )
            // Configure our custom bar renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customBar'),
          charts.Series<LinearSales, int>(
            id: 'Mobile',
            colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
            domainFn: (LinearSales sales, _) => sales.year,
            measureFn: (LinearSales sales, _) => sales.sales,
            data: mobileSalesData,
          ),
        ],
        animate: true,
        // Configure the default renderer as a line renderer. This will be used
        // for any series that does not define a rendererIdKey.
        defaultRenderer: charts.LineRendererConfig(),
        // Custom renderer configuration for the bar series.
        customSeriesRenderers: [
          charts.BarRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customBar')
        ]);
  }
}

final desktopSalesData = [
  LinearSales(0, 5),
  LinearSales(1, 25),
  LinearSales(2, 100),
  LinearSales(3, 75),
];

final tableSalesData = [
  LinearSales(0, 5),
  LinearSales(1, 25),
  LinearSales(2, 100),
  LinearSales(3, 75),
];

final mobileSalesData = [
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
