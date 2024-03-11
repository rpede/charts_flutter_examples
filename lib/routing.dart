import 'package:flutter/material.dart';

import 'examples/area_and_line_line.dart';
import 'examples/chart_title_behaviors.dart';
import 'examples/custom_axis_tick_formatters.dart';
import 'examples/custom_rounded_bars_bar.dart';
import 'examples/default_hidden_series_legend.dart';
import 'examples/grouped_bar.dart';
import 'examples/grouped_fill_color_bar.dart';
import 'examples/grouped_stacked_bar.dart';
import 'examples/grouped_stacked_weight_pattern_bar.dart';
import 'examples/grouped_target_line_bar.dart';
import 'examples/horizontal_bar.dart';
import 'examples/horizontal_bar_label_bar.dart';
import 'examples/horizontal_bar_label_custom_bar.dart';
import 'examples/horizontal_pattern_forward_hatch_bar.dart';
import 'examples/initial_hint_animation_behaviors.dart';
import 'examples/initial_selection_interactions.dart';
import 'examples/legend_custom_symbol.dart';
import 'examples/legend_options_legends.dart';
import 'examples/legend_with_measures.dart';
import 'examples/numeric_line_bar_combo.dart';
import 'examples/numeric_line_point_combo.dart';
import 'examples/pattern_forward_hatch_bar.dart';
import 'examples/percent_of_domain_by_category_interactions.dart';
import 'examples/percent_of_domain_interactions.dart';
import 'examples/percent_of_series_interactions.dart';
import 'examples/points_line.dart';
import 'examples/scatter_plot_line_combo.dart';
import 'examples/selection_bar_highlight_interactions.dart';
import 'examples/selection_callback_example_interactions.dart';
import 'examples/selection_line_highlight_behaviors.dart';
import 'examples/selection_user_managed_behaviors.dart';
import 'examples/simple_line.dart';
import 'examples/simple_series_legend_legends.dart';
import 'examples/slider_behaviors.dart';
import 'examples/sliding_viewport_on_selection_behaviors.dart';
import 'examples/spark_bar.dart';
import 'examples/stacked_area_custom_color_line.dart';
import 'examples/stacked_area_line.dart';
import 'examples/stacked_bar.dart';
import 'examples/stacked_fill_color_bar.dart';
import 'examples/vertical_bar_label_bar.dart';
import 'example_page.dart';
import 'examples/confidence_interval_time_series.dart';
import 'examples/end_points_axis_time_series.dart';
import 'examples/line_annotation_time_series.dart';
import 'examples/ordinal_bar_line_combo.dart';
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
  // 'horizontal_bar_label_bar': HorizontalBarLabelChart.new,
  'horizontal_bar_label_custom_bar': HorizontalBarLabelCustomChart.new,
  'vertical_bar_label_bar': VerticalBarLabelChart.new,
  // 'spark_bar': SparkBar.new,
  'grouped_fill_color_bar': GroupedFillColorBarChart.new,
  'stacked_fill_color_bar': StackedFillColorBarChart.new,
  'pattern_forward_hatch_bar': PatternForwardHatchBarChart.new,
  // 'horizontal_pattern_forward_hatch_bar':
  //     HorizontalPatternForwardHatchBarChart.new,
  'grouped_stacked_weight_pattern_bar': GroupedStackedWeightPatternBarChart.new,
  'custom_rounded_bars_bar': CustomRoundedBars.new,
  // Time series
  'simple_time_series': SimpleTimeSeriesChart.new,
  'end_points_axis_time_series': EndPointsAxisTimeSeriesChart.new,
  'confidence_interval_time_series': TimeSeriesConfidenceInterval.new,
  'line_annotation_time_series': TimeSeriesLineAnnotationChart.new,
  'range_annotation_time_series': TimeSeriesRangeAnnotationChart.new,
  'range_annotation_margin_time_series':
      TimeSeriesRangeAnnotationMarginChart.new,
  'symbol_annotation_time_series': TimeSeriesSymbolAnnotationChart.new,
  'with_bar_renderer_time_series': TimeSeriesBar.new,
  // Line
  'simple_line': SimpleLineChart.new,
  'points_line': PointsLineChart.new,
  'stacked_area_line': StackedAreaLineChart.new,
  'stacked_area_custom_color_line': StackedAreaCustomColorLineChart.new,
  'area_and_line_line': AreaAndLineChart.new,
  // Combo
  'ordinal_bar_line_combo': OrdinalComboBarLineChart.new,
  'numeric_line_bar_combo': NumericComboLineBarChart.new,
  'numeric_line_point_combo': NumericComboLinePointChart.new,
  'scatter_plot_line_combo': ScatterPlotComboLineChart.new,
  // Axis
  'custom_axis_tick_formatters': CustomAxisTickFormatters.new,
  // Legends
  'simple_series_legend_legends': SimpleSeriesLegend.new,
  'legend_options_legends': LegendOptions.new,
  'legend_with_measures': LegendWithMeasures.new,
  'legend_custom_symbol': LegendWithCustomSymbol.new,
  'default_hidden_series_legend': DefaultHiddenSeriesLegend.new,
  // Behaviors
  'initial_selection_interactions': InitialSelection.new,
  'selection_bar_highlight_interactions': SelectionBarHighlight.new,
  'selection_line_highlight_behaviors': SelectionLineHighlight.new,
  // 'selection_user_managed_behaviors': SelectionUserManaged.new,
  'selection_callback_example_interactions': SelectionCallbackExample.new,
  'chart_title_behaviors': ChartTitleLine.new,
  // 'slider_behaviors': SliderLine.new,
  'sliding_viewport_on_selection_behaviors': SlidingViewportOnSelection.new,
  // 'percent_of_domain_interactions': PercentOfDomainBarChart.new,
  // 'percent_of_domain_by_category_interactions':
  //     PercentOfDomainByCategoryBarChart.new,
  // 'percent_of_series_interactions': PercentOfSeriesBarChart.new,
  'initial_hint_animation_behaviors': InitialHintAnimation.new,
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
