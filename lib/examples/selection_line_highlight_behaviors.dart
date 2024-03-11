// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class SelectionLineHighlight extends StatelessWidget {
  const SelectionLineHighlight({super.key});

  @override
  Widget build(BuildContext context) {
    // This is just a simple line chart with a behavior that highlights the
    // selected points along the lines. A point will be drawn at the selected
    // datum's x,y coordinate, and a vertical follow line will be drawn through
    // it.
    //
    // A [Charts.LinePointHighlighter] behavior is added manually to enable the
    // highlighting effect.
    //
    // As an alternative, [defaultInteractions] can be set to true to include
    // the default chart interactions, including a LinePointHighlighter.
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
        behaviors: [
          // Optional - Configures a [LinePointHighlighter] behavior with a
          // vertical follow line. A vertical follow line is included by
          // default, but is shown here as an example configuration.
          //
          // By default, the line has default dash pattern of [1,3]. This can be
          // set by providing a [dashPattern] or it can be turned off by passing in
          // an empty list. An empty list is necessary because passing in a null
          // value will be treated the same as not passing in a value at all.
          charts.LinePointHighlighter(
              showHorizontalFollowLine:
                  charts.LinePointHighlighterFollowLineType.none,
              showVerticalFollowLine:
                  charts.LinePointHighlighterFollowLineType.nearest),
          // Optional - By default, select nearest is configured to trigger
          // with tap so that a user can have pan/zoom behavior and line point
          // highlighter. Changing the trigger to tap and drag allows the
          // highlighter to follow the dragging gesture but it is not
          // recommended to be used when pan/zoom behavior is enabled.
          charts.SelectNearest(
              eventTrigger: charts.SelectionTrigger.tapAndDrag)
        ]);
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
