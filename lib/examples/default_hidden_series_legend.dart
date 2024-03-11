/// Bar chart with default hidden series legend example
library;
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

class DefaultHiddenSeriesLegend extends StatelessWidget {
  const DefaultHiddenSeriesLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        charts.Series<OrdinalSales, String>(
          id: 'Desktop',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesData,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Tablet',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tabletSalesData,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Mobile',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesData,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Other',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: otherSalesData,
        ),
      ],
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [
        charts.SeriesLegend(
          // Configures the "Other" series to be hidden on first chart draw.
          defaultHiddenSeries: const ['Other'],
        )
      ],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    return [];
  }
}

final desktopSalesData = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

final tabletSalesData = [
  OrdinalSales('2014', 25),
  OrdinalSales('2015', 50),
  OrdinalSales('2016', 10),
  OrdinalSales('2017', 20),
];

final mobileSalesData = [
  OrdinalSales('2014', 10),
  OrdinalSales('2015', 15),
  OrdinalSales('2016', 50),
  OrdinalSales('2017', 45),
];

final otherSalesData = [
  OrdinalSales('2014', 20),
  OrdinalSales('2015', 35),
  OrdinalSales('2016', 15),
  OrdinalSales('2017', 10),
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
