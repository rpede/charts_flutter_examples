/// Example of a stacked area chart with custom area colors.
///
/// By default, the area skirt for a chart will be drawn with the same color as
/// the line, but with a 10% opacity assigned to it. An area color function can
/// be provided to override this with any custom color.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class StackedAreaCustomColorLineChart extends StatelessWidget {
  const StackedAreaCustomColorLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      [
        charts.Series<LinearSales, int>(
          id: 'Desktop',
          // colorFn specifies that the line will be blue.
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          // areaColorFn specifies that the area skirt will be light blue.
          areaColorFn: (_, __) =>
              charts.MaterialPalette.blue.shadeDefault.lighter,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeDesktopData,
        ),
        charts.Series<LinearSales, int>(
          id: 'Tablet',
          // colorFn specifies that the line will be red.
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          // areaColorFn specifies that the area skirt will be light red.
          areaColorFn: (_, __) =>
              charts.MaterialPalette.red.shadeDefault.lighter,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeTabletData,
        ),
        charts.Series<LinearSales, int>(
          id: 'Mobile',
          // colorFn specifies that the line will be green.
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          // areaColorFn specifies that the area skirt will be light green.
          areaColorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.lighter,
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
