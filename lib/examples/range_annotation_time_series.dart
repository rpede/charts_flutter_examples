/// Time series chart with range annotation example
///
/// The example future range annotation extends beyond the range of the series
/// data, demonstrating the effect of the [Charts.RangeAnnotation.extendAxis]
/// flag. This can be set to false to disable range extension.
///
/// Additional annotations may be added simply by adding additional
/// [Charts.RangeAnnotationSegment] items to the list.
library;

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class TimeSeriesRangeAnnotationChart extends StatelessWidget {
  const TimeSeriesRangeAnnotationChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      [
        charts.Series<TimeSeriesSales, DateTime>(
          id: 'Sales',
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: data,
        )
      ],
      animate: true,
      behaviors: [
        charts.RangeAnnotation([
          charts.RangeAnnotationSegment(
            DateTime(2017, 10, 4),
            DateTime(2017, 10, 15),
            charts.RangeAnnotationAxisType.domain,
          ),
        ]),
      ],
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
