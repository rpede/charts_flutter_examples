/// Example of a combo scatter plot chart with a second series rendered as a
/// line.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class ScatterPlotComboLineChart extends StatelessWidget {
  const ScatterPlotComboLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.ScatterPlotChart(
        [
          charts.Series<LinearSales, int>(
            id: 'Sales',
            // Providing a color function is optional.
            colorFn: (LinearSales sales, _) {
              // Bucket the measure column value into 3 distinct colors.
              final bucket = sales.sales / maxMeasure;

              if (bucket < 1 / 3) {
                return charts.MaterialPalette.blue.shadeDefault;
              } else if (bucket < 2 / 3) {
                return charts.MaterialPalette.red.shadeDefault;
              } else {
                return charts.MaterialPalette.green.shadeDefault;
              }
            },
            domainFn: (LinearSales sales, _) => sales.year,
            measureFn: (LinearSales sales, _) => sales.sales,
            // Providing a radius function is optional.
            radiusPxFn: (LinearSales sales, _) => sales.radius,
            data: desktopSalesData,
          ),
          charts.Series<LinearSales, int>(
              id: 'Mobile',
              colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
              domainFn: (LinearSales sales, _) => sales.year,
              measureFn: (LinearSales sales, _) => sales.sales,
              data: myRegressionData)
            // Configure our custom line renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customLine'),
        ],
        animate: true,
        // Configure the default renderer as a point renderer. This will be used
        // for any series that does not define a rendererIdKey.
        //
        // This is the default configuration, but is shown here for
        // illustration.
        defaultRenderer: charts.PointRendererConfig(),
        // Custom renderer configuration for the line series.
        customSeriesRenderers: [
          charts.LineRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customLine',
              // Configure the regression line to be painted above the points.
              //
              // By default, series drawn by the point renderer are painted on
              // top of those drawn by a line renderer.
              layoutPaintOrder: charts.LayoutViewPaintOrder.point + 1)
        ]);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    return [];
  }
}

final desktopSalesData = [
  LinearSales(0, 5, 3.0),
  LinearSales(10, 25, 5.0),
  LinearSales(12, 75, 4.0),
  LinearSales(13, 225, 5.0),
  LinearSales(16, 50, 4.0),
  LinearSales(24, 75, 3.0),
  LinearSales(25, 100, 3.0),
  LinearSales(34, 150, 5.0),
  LinearSales(37, 10, 4.5),
  LinearSales(45, 300, 8.0),
  LinearSales(52, 15, 4.0),
  LinearSales(56, 200, 7.0),
];

var myRegressionData = [
  LinearSales(0, 5, 3.5),
  LinearSales(56, 240, 3.5),
];

const maxMeasure = 300;

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final double radius;

  LinearSales(this.year, this.sales, this.radius);
}
