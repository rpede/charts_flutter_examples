/// Example of a percentage bar chart which shows each bar as the percentage of
/// the total series measure value.
library;
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

class PercentOfSeriesBarChart extends StatelessWidget {
  const PercentOfSeriesBarChart({super.key});

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
      ],
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      // Configures a [PercentInjector] behavior that will calculate measure
      // values as the percentage of the total of all data in its series.
      behaviors: [
        charts.PercentInjector(
            totalType: charts.PercentInjectorTotalType.series)
      ],
      // Configure the axis spec to show percentage values.
      primaryMeasureAxis: charts.PercentAxisSpec(),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    return [];
  }
}

final desktopSalesData = [
  OrdinalSales('2011', 5),
  OrdinalSales('2012', 25),
  OrdinalSales('2013', 50),
  OrdinalSales('2014', 75),
  OrdinalSales('2015', 100),
  OrdinalSales('2016', 125),
  OrdinalSales('2017', 200),
  OrdinalSales('2018', 150),
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
