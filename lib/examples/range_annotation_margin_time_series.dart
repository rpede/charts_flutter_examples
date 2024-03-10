/// Example of a time series chart with range annotations configured to render
/// labels in the chart margin area.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class TimeSeriesRangeAnnotationMarginChart extends StatelessWidget {
  const TimeSeriesRangeAnnotationMarginChart({super.key});

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

        // Allow enough space in the left and right chart margins for the
        // annotations.
        layoutConfig: charts.LayoutConfig(
            leftMarginSpec: charts.MarginSpec.fixedPixel(60),
            topMarginSpec: charts.MarginSpec.fixedPixel(20),
            rightMarginSpec: charts.MarginSpec.fixedPixel(60),
            bottomMarginSpec: charts.MarginSpec.fixedPixel(20)),
        behaviors: [
          // Define one domain and two measure annotations configured to render
          // labels in the chart margins.
          charts.RangeAnnotation([
            charts.RangeAnnotationSegment(
                DateTime(2017, 10, 4),
                DateTime(2017, 10, 15),
                charts.RangeAnnotationAxisType.domain,
                startLabel: 'D1 Start',
                endLabel: 'D1 End',
                labelAnchor: charts.AnnotationLabelAnchor.end,
                color: charts.MaterialPalette.gray.shade200,
                // Override the default vertical direction for domain labels.
                labelDirection: charts.AnnotationLabelDirection.horizontal),
            charts.RangeAnnotationSegment(
                15, 20, charts.RangeAnnotationAxisType.measure,
                startLabel: 'M1 Start',
                endLabel: 'M1 End',
                labelAnchor: charts.AnnotationLabelAnchor.end,
                color: charts.MaterialPalette.gray.shade300),
            charts.RangeAnnotationSegment(
                35, 65, charts.RangeAnnotationAxisType.measure,
                startLabel: 'M2 Start',
                endLabel: 'M2 End',
                labelAnchor: charts.AnnotationLabelAnchor.start,
                color: charts.MaterialPalette.gray.shade300),
          ], defaultLabelPosition: charts.AnnotationLabelPosition.margin),
        ]);
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
