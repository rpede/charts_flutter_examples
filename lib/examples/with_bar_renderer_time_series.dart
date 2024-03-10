/// Example of a time series chart using a bar renderer.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class TimeSeriesBar extends StatelessWidget {
  const TimeSeriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      [
        charts.Series<TimeSeriesSales, DateTime>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (TimeSeriesSales sales, _) => sales.time,
          measureFn: (TimeSeriesSales sales, _) => sales.sales,
          data: data,
        )
      ],
      animate: true,
      // Set the default renderer to a bar renderer.
      // This can also be one of the custom renderers of the time series chart.
      defaultRenderer: charts.BarRendererConfig<DateTime>(),
      // It is recommended that default interactions be turned off if using bar
      // renderer, because the line point highlighter is the default for time
      // series chart.
      defaultInteractions: false,
      // If default interactions were removed, optionally add select nearest
      // and the domain highlighter that are typical for bar charts.
      behaviors: [charts.SelectNearest(), charts.DomainHighlighter()],
    );
  }
}

final data = [
  TimeSeriesSales(DateTime(2017, 9, 1), 5),
  TimeSeriesSales(DateTime(2017, 9, 2), 5),
  TimeSeriesSales(DateTime(2017, 9, 3), 25),
  TimeSeriesSales(DateTime(2017, 9, 4), 100),
  TimeSeriesSales(DateTime(2017, 9, 5), 75),
  TimeSeriesSales(DateTime(2017, 9, 6), 88),
  TimeSeriesSales(DateTime(2017, 9, 7), 65),
  TimeSeriesSales(DateTime(2017, 9, 8), 91),
  TimeSeriesSales(DateTime(2017, 9, 9), 100),
  TimeSeriesSales(DateTime(2017, 9, 10), 111),
  TimeSeriesSales(DateTime(2017, 9, 11), 90),
  TimeSeriesSales(DateTime(2017, 9, 12), 50),
  TimeSeriesSales(DateTime(2017, 9, 13), 40),
  TimeSeriesSales(DateTime(2017, 9, 14), 30),
  TimeSeriesSales(DateTime(2017, 9, 15), 40),
  TimeSeriesSales(DateTime(2017, 9, 16), 50),
  TimeSeriesSales(DateTime(2017, 9, 17), 30),
  TimeSeriesSales(DateTime(2017, 9, 18), 35),
  TimeSeriesSales(DateTime(2017, 9, 19), 40),
  TimeSeriesSales(DateTime(2017, 9, 20), 32),
  TimeSeriesSales(DateTime(2017, 9, 21), 31),
];

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}
