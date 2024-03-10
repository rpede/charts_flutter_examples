/// Example of a time series chart with a confidence interval.
///
/// Confidence interval is defined by specifying the upper and lower measure
/// bounds in the series.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class TimeSeriesConfidenceInterval extends StatelessWidget {
  const TimeSeriesConfidenceInterval({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      [
        charts.Series<TimeSeriesSales, DateTime>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          // When the measureLowerBoundFn and measureUpperBoundFn is defined,
          // the line renderer will render the area around the bounds.
          measureLowerBoundFn: (TimeSeriesSales sales, _) => sales.sales - 5,
          measureUpperBoundFn: (TimeSeriesSales sales, _) => sales.sales + 5,
          data: data,
        )
      ],
      animate: true,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}

final data = [
  TimeSeriesSales(DateTime(2017, 9, 19), 5),
  TimeSeriesSales(DateTime(2017, 9, 26), 25),
  TimeSeriesSales(DateTime(2017, 10, 3), 100),
  TimeSeriesSales(DateTime(2017, 10, 10), 75),
];

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
