// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

/// This is a line chart with a title text in every margin.
///
/// A series of [ChartTitle] behaviors are used to render titles, one per
/// margin.
class ChartTitleLine extends StatelessWidget {
  const ChartTitleLine({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      [
        charts.Series<LinearSales, int>(
          id: 'Sales',
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: data,
        )
      ],
      animate: true,
      // Configures four [ChartTitle] behaviors to render titles in each chart
      // margin. The top title has a sub-title, and is aligned to the left edge
      // of the chart. The other titles are aligned with the middle of the draw
      // area.
      behaviors: [
        charts.ChartTitle('Top title text',
            subTitle: 'Top sub-title text',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.start,
            // Set a larger inner padding than the default (10) to avoid
            // rendering the text too close to the top measure axis tick label.
            // The top tick label may extend upwards into the top margin region
            // if it is located at the top of the draw area.
            innerPadding: 18),
        charts.ChartTitle('Bottom title text',
            behaviorPosition: charts.BehaviorPosition.bottom,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('Start title',
            behaviorPosition: charts.BehaviorPosition.start,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
        charts.ChartTitle('End title',
            behaviorPosition: charts.BehaviorPosition.end,
            titleOutsideJustification:
                charts.OutsideJustification.middleDrawArea),
      ],
    );
  }
}

final data = [
  LinearSales(0, 5),
  LinearSales(1, 25),
  LinearSales(2, 100),
  LinearSales(3, 75),
];

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
