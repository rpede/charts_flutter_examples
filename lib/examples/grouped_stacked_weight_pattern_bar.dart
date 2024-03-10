/// Example of a bar chart with grouped, stacked series oriented vertically with
/// a custom weight pattern.
///
/// This is a pattern of weights used to calculate the width of bars within a
/// bar group. If not specified, each bar in the group will have an equal width.
library;
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

class GroupedStackedWeightPatternBarChart extends StatelessWidget {
  const GroupedStackedWeightPatternBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        charts.Series<OrdinalSales, String>(
          id: 'Desktop A',
          seriesCategory: 'A',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesDataA,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Tablet A',
          seriesCategory: 'A',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesDataA,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Mobile A',
          seriesCategory: 'A',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesDataA,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Desktop B',
          seriesCategory: 'B',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: desktopSalesDataB,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Tablet B',
          seriesCategory: 'B',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: tableSalesDataB,
        ),
        charts.Series<OrdinalSales, String>(
          id: 'Mobile B',
          seriesCategory: 'B',
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: mobileSalesDataB,
        ),
      ],
      animate: true,
      // Configure the bar renderer in grouped stacked rendering mode with a
      // custom weight pattern.
      //
      // The first stack of bars in each group is configured to be twice as wide
      // as the second stack of bars in each group.
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.groupedStacked,
        weightPattern: [2, 1],
      ),
    );
  }
}

final desktopSalesDataA = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

final tableSalesDataA = [
  OrdinalSales('2014', 25),
  OrdinalSales('2015', 50),
  OrdinalSales('2016', 10),
  OrdinalSales('2017', 20),
];

final mobileSalesDataA = [
  OrdinalSales('2014', 10),
  OrdinalSales('2015', 15),
  OrdinalSales('2016', 50),
  OrdinalSales('2017', 45),
];

final desktopSalesDataB = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

final tableSalesDataB = [
  OrdinalSales('2014', 25),
  OrdinalSales('2015', 50),
  OrdinalSales('2016', 10),
  OrdinalSales('2017', 20),
];

final mobileSalesDataB = [
  OrdinalSales('2014', 10),
  OrdinalSales('2015', 15),
  OrdinalSales('2016', 50),
  OrdinalSales('2017', 45),
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
