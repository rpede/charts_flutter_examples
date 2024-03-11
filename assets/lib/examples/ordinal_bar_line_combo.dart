/// Example of an ordinal combo chart with two series rendered as bars, and a
/// third rendered as a line.
library;
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

class OrdinalComboBarLineChart extends StatelessWidget {
  const OrdinalComboBarLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.OrdinalComboChart(
        [
          charts.Series<OrdinalSales, String>(
              id: 'Desktop',
              colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              domainFn: (OrdinalSales sales, _) => sales.year,
              measureFn: (OrdinalSales sales, _) => sales.sales,
              data: desktopSalesData),
          charts.Series<OrdinalSales, String>(
              id: 'Tablet',
              colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
              domainFn: (OrdinalSales sales, _) => sales.year,
              measureFn: (OrdinalSales sales, _) => sales.sales,
              data: tableSalesData),
          charts.Series<OrdinalSales, String>(
              id: 'Mobile ',
              colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
              domainFn: (OrdinalSales sales, _) => sales.year,
              measureFn: (OrdinalSales sales, _) => sales.sales,
              data: mobileSalesData)
            // Configure our custom line renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customLine'),
        ],
        animate: true,
        // Configure the default renderer as a bar renderer.
        defaultRenderer: charts.BarRendererConfig(
            groupingType: charts.BarGroupingType.grouped),
        // Custom renderer configuration for the line series. This will be used for
        // any series that does not define a rendererIdKey.
        customSeriesRenderers: [
          charts.LineRendererConfig(
              // ID used to link series to this renderer.
              customRendererId: 'customLine')
        ]);
  }
}

final desktopSalesData = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

final tableSalesData = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

final mobileSalesData = [
  OrdinalSales('2014', 10),
  OrdinalSales('2015', 50),
  OrdinalSales('2016', 200),
  OrdinalSales('2017', 150),
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
