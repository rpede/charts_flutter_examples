/// Horizontal bar chart with bar label renderer example and hidden domain axis.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class HorizontalBarLabelChart extends StatelessWidget {
  const HorizontalBarLabelChart({super.key});

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit and the
  // area outside of the bar is larger than the bar, it will draw outside of the
  // bar. Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      [
        charts.Series<OrdinalSales, String>(
            id: 'Sales',
            domainFn: (OrdinalSales sales, _) => sales.year,
            measureFn: (OrdinalSales sales, _) => sales.sales,
            data: data,
            // Set a label accessor to control the text of the bar label.
            labelAccessorFn: (OrdinalSales sales, _) =>
                '${sales.year}: \$${sales.sales.toString()}')
      ],
      animate: true,
      vertical: false,
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis:
          const charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
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
