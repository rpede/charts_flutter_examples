import 'package:charts_flutter_examples/examples/custom_rounded_bars_bar.dart';
import 'package:charts_flutter_examples/examples/grouped_bar.dart';
import 'package:charts_flutter_examples/examples/grouped_fill_color_bar.dart';
import 'package:charts_flutter_examples/examples/grouped_stacked_bar.dart';
import 'package:charts_flutter_examples/examples/grouped_stacked_weight_pattern_bar.dart';
import 'package:charts_flutter_examples/examples/grouped_target_line_bar.dart';
import 'package:charts_flutter_examples/examples/horizontal_bar.dart';
import 'package:charts_flutter_examples/examples/horizontal_bar_label_bar.dart';
import 'package:charts_flutter_examples/examples/horizontal_bar_label_custom_bar.dart';
import 'package:charts_flutter_examples/examples/horizontal_pattern_forward_hatch_bar.dart';
import 'package:charts_flutter_examples/examples/pattern_forward_hatch_bar.dart';
import 'package:charts_flutter_examples/examples/spark_bar.dart';
import 'package:charts_flutter_examples/examples/stacked_bar.dart';
import 'package:charts_flutter_examples/examples/stacked_fill_color_bar.dart';
import 'package:charts_flutter_examples/examples/vertical_bar_label_bar.dart';
import 'package:flutter/material.dart';

import 'example_page.dart';
import 'examples/confidence_interval_time_series.dart';
import 'examples/end_points_axis_time_series.dart';
import 'examples/line_annotation_time_series.dart';
import 'examples/range_annotation_margin_time_series.dart';
import 'examples/range_annotation_time_series.dart';
import 'examples/simple_bar.dart';
import 'examples/simple_time_series.dart';
import 'examples/symbol_annotation_time_series.dart';
import 'examples/with_bar_renderer_time_series.dart';
import 'overview_page.dart';

final Map<String, Widget Function()> examples = {
  // Bar chart
  'simple_bar': SimpleBarChart.new,
  'stacked_bar': StackedBarChart.new,
  'grouped_bar': GroupedBarChart.new,
  'grouped_stacked_bar': GroupedStackedBarChart.new,
  'grouped_target_line_bar': GroupedBarTargetLineChart.new,
  'horizontal_bar': HorizontalBarChart.new,
  'horizontal_bar_label_bar': HorizontalBarLabelChart.new,
  'horizontal_bar_label_custom_bar': HorizontalBarLabelCustomChart.new,
  'vertical_bar_label_bar': VerticalBarLabelChart.new,
  'spark_bar': SparkBar.new,
  'grouped_fill_color_bar': GroupedFillColorBarChart.new,
  'stacked_fill_color_bar': StackedFillColorBarChart.new,
  'pattern_forward_hatch_bar': PatternForwardHatchBarChart.new,
  'horizontal_pattern_forward_hatch_bar': HorizontalPatternForwardHatchBarChart.new,
  'grouped_stacked_weight_pattern_bar': GroupedStackedWeightPatternBarChart.new,
  'custom_rounded_bars_bar': CustomRoundedBars.new,
  // Time series
  'simple_time_series': SimpleTimeSeriesChart.new,
  'end_points_axis_time_series': EndPointsAxisTimeSeriesChart.new,
  'confidence_interval_time_series': TimeSeriesConfidenceInterval.new,
  'line_annotation_time_series': TimeSeriesLineAnnotationChart.new,
  'range_annotation_time_series': TimeSeriesRangeAnnotationChart.new,
  'range_annotation_margin_time_series': TimeSeriesRangeAnnotationMarginChart.new,
  'symbol_annotation_time_series': TimeSeriesSymbolAnnotationChart.new,
  'with_bar_renderer_time_series': TimeSeriesBar.new,
};

final Map<String, ExampleDef> examplesExtended =
    examples.map((key, value) => MapEntry(key, (
          title: key.toTitle(),
          code: 'lib/examples/$key.dart',
          image: 'images/$key.png',
          builder: value,
        )));

final Map<String, Widget Function(BuildContext)> routes = {
  // When navigating to the "/" route, build the FirstScreen widget.
  '/': (context) => const OverviewPage(),
  // When navigating to the "/second" route, build the SecondScreen widget.
  // '/second': (context) => const SecondScreen(),
}..addAll(examplesExtended.map((key, value) =>
    MapEntry(key, (BuildContext context) => ExamplePage(value))));

typedef ExampleDef = ({
  String title,
  String code,
  String image,
  Widget Function() builder
});

extension StringX on String {
  String toTitle() {
    return split('_')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join(' ')
        .toString();
  }
}
