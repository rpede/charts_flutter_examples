/// Bar chart example
library;
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

/// Example of a grouped bar chart with three series, each rendered with
/// different fill colors.
class GroupedFillColorBarChart extends StatelessWidget {
  const GroupedFillColorBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        // Blue bars with a lighter center color.
        charts.Series<OrdinalSales, String>(
          id: 'Desktop',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData,
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          fillColorFn: (_, __) =>
              charts.MaterialPalette.blue.shadeDefault.lighter,
        ),
        // Solid red bars. Fill color will default to the series color if no
        // fillColorFn is configured.
        charts.Series<OrdinalSales, String>(
          id: 'Tablet',
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesData,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
        ),
        // Hollow green bars.
        charts.Series<OrdinalSales, String>(
          id: 'Mobile',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesData,
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          fillColorFn: (_, __) => charts.MaterialPalette.transparent,
        ),
      ],
      animate: true,
      // Configure a stroke width to enable borders on the bars.
      defaultRenderer: charts.BarRendererConfig(
          groupingType: charts.BarGroupingType.grouped, strokeWidthPx: 2.0),
    );
  }
}

final desktopSalesData = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

final tableSalesData = [
  OrdinalSales('2014', 25),
  OrdinalSales('2015', 50),
  OrdinalSales('2016', 10),
  OrdinalSales('2017', 20),
];

final mobileSalesData = [
  OrdinalSales('2014', 10),
  OrdinalSales('2015', 50),
  OrdinalSales('2016', 50),
  OrdinalSales('2017', 45),
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
