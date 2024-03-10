/// Bar chart example
library;
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;

class GroupedBarTargetLineChart extends StatelessWidget {
  const GroupedBarTargetLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
        [
          charts.Series<OrdinalSales, String>(
            id: 'Desktop',
            domainFn: (OrdinalSales sales, _) => sales.year,
            measureFn: (OrdinalSales sales, _) => sales.sales,
            data: desktopSalesData,
          ),
          charts.Series<OrdinalSales, String>(
            id: 'Tablet',
            domainFn: (OrdinalSales sales, _) => sales.year,
            measureFn: (OrdinalSales sales, _) => sales.sales,
            data: tableSalesData,
          ),
          charts.Series<OrdinalSales, String>(
            id: 'Mobile',
            domainFn: (OrdinalSales sales, _) => sales.year,
            measureFn: (OrdinalSales sales, _) => sales.sales,
            data: mobileSalesData,
          ),
          charts.Series<OrdinalSales, String>(
            id: 'Desktop Target Line',
            domainFn: (OrdinalSales sales, _) => sales.year,
            measureFn: (OrdinalSales sales, _) => sales.sales,
            data: desktopTargetLineData,
          )
            // Configure our custom bar target renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
          charts.Series<OrdinalSales, String>(
            id: 'Tablet Target Line',
            domainFn: (OrdinalSales sales, _) => sales.year,
            measureFn: (OrdinalSales sales, _) => sales.sales,
            data: tableTargetLineData,
          )
            // Configure our custom bar target renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
          charts.Series<OrdinalSales, String>(
            id: 'Mobile Target Line',
            domainFn: (OrdinalSales sales, _) => sales.year,
            measureFn: (OrdinalSales sales, _) => sales.sales,
            data: mobileTargetLineData,
          )
            // Configure our custom bar target renderer for this series.
            ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
        ],
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
        customSeriesRenderers: [
          charts.BarTargetLineRendererConfig<String>(
              // ID used to link series to this renderer.
              customRendererId: 'customTargetLine',
              groupingType: charts.BarGroupingType.grouped)
        ]);
  }
}

final desktopSalesData = [
  OrdinalSales('2014', 5),
  OrdinalSales('2015', 25),
  OrdinalSales('2016', 100),
  OrdinalSales('2017', 75),
];

final tableSalesData = [
  OrdinalSales('2014', 25),
  OrdinalSales('2015', 50),
  OrdinalSales('2016', 10),
  OrdinalSales('2017', 20),
];

final mobileSalesData = [
  OrdinalSales('2014', 10),
  OrdinalSales('2015', 15),
  OrdinalSales('2016', 50),
  OrdinalSales('2017', 45),
];

final desktopTargetLineData = [
  OrdinalSales('2014', 4),
  OrdinalSales('2015', 20),
  OrdinalSales('2016', 80),
  OrdinalSales('2017', 65),
];

final tableTargetLineData = [
  OrdinalSales('2014', 30),
  OrdinalSales('2015', 55),
  OrdinalSales('2016', 15),
  OrdinalSales('2017', 25),
];

final mobileTargetLineData = [
  OrdinalSales('2014', 10),
  OrdinalSales('2015', 5),
  OrdinalSales('2016', 45),
  OrdinalSales('2017', 35),
];

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
