/// Horizontal bar chart with custom style for each datum in the bar label.
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class HorizontalBarLabelCustomChart extends StatelessWidget {
  const HorizontalBarLabelCustomChart({super.key});

  // The [BarLabelDecorator] has settings to set the text style for all labels
  // for inside the bar and outside the bar. To be able to control each datum's
  // style, set the style accessor functions on the series.
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
              '${sales.year}: \$${sales.sales.toString()}',
          insideLabelStyleAccessorFn: (OrdinalSales sales, _) {
            final color = (sales.year == '2014')
                ? charts.MaterialPalette.red.shadeDefault
                : charts.MaterialPalette.yellow.shadeDefault.darker;
            return charts.TextStyleSpec(color: color);
          },
          outsideLabelStyleAccessorFn: (OrdinalSales sales, _) {
            final color = (sales.year == '2014')
                ? charts.MaterialPalette.red.shadeDefault
                : charts.MaterialPalette.yellow.shadeDefault.darker;
            return charts.TextStyleSpec(color: color);
          },
        ),
      ],
      animate: true,
      vertical: false,
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
