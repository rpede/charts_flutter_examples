/// Example of adding an initial selection behavior.
///
/// This example adds initial selection to a bar chart, but any chart can use
/// the initial selection behavior.
///
/// Initial selection is only set on the very first draw and will not be set
/// again in subsequent draws unless the behavior is reconfigured.
///
/// The selection will remain on the chart unless another behavior is added
/// that updates the selection.
library;

import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class InitialSelection extends StatelessWidget {
  const InitialSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        charts.Series<OrdinalSales, String>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
        )
      ],
      animate: true,
      behaviors: [
        // Initial selection can be configured by passing in:
        //
        // A list of datum config, specified with series ID and domain value.
        // A list of series config, which is a list of series ID(s).
        //
        // Initial selection can be applied to any chart type.
        //
        // [BarChart] by default includes behaviors [SelectNearest] and
        // [DomainHighlighter]. So this behavior shows the initial selection
        // highlighted and when another datum is tapped, the selection changes.
        charts.InitialSelection(selectedDataConfig: [
          charts.SeriesDatumConfig<String>('Sales', '2016')
        ])
      ],
    );
  }
}

final data = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
