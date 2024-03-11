/// Example of using user managed state to programmatically set selection.
///
/// In this example, clicking the "clear selection" button sets the selection
/// to an empty selection. This example also shows that initial selection
/// behavior can still be used with user managed state.
///
/// Note that the picture in this example is not interactive, please run the
/// gallery app to try out using the button to clear selection.
///
library;
import 'package:community_charts_flutter/community_charts_flutter.dart'
    as charts;
import 'package:flutter/material.dart';

class SelectionUserManaged extends StatefulWidget {
  const SelectionUserManaged({super.key});

  @override
  SelectionUserManagedState createState() {
    return SelectionUserManagedState();
  }
}

class SelectionUserManagedState extends State<SelectionUserManaged> {
  final _myState = charts.UserManagedState<String>();

  @override
  Widget build(BuildContext context) {
    final chart = charts.BarChart(
      [
        charts.Series<OrdinalSales, String>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (OrdinalSales sales, _) => sales.year,
          measureFn: (OrdinalSales sales, _) => sales.sales,
          data: data,
        )
      ],
      animate: false, //widget.animate,
      selectionModels: [
        charts.SelectionModelConfig(
            type: charts.SelectionModelType.info,
            updatedListener: _infoSelectionModelUpdated)
      ],
      // Pass in the state you manage to the chart. This will be used to
      // override the internal chart state.
      userManagedState: _myState,
      // The initial selection can still be optionally added by adding the
      // initial selection behavior.
      behaviors: [
        charts.InitialSelection(selectedDataConfig: [
          charts.SeriesDatumConfig<String>('Sales', '2016')
        ])
      ],
    );

    final clearSelection = MaterialButton(
        onPressed: _handleClearSelection, child: const Text('Clear Selection'));

    return Column(
        children: [SizedBox(height: 150.0, child: chart), clearSelection]);
  }

  void _infoSelectionModelUpdated(charts.SelectionModel<String> model) {
    // If you want to allow the chart to continue to respond to select events
    // that update the selection, add an updatedListener that saves off the
    // selection model each time the selection model is updated, regardless of
    // if there are changes.
    //
    // This also allows you to listen to the selection model update events and
    // alter the selection.
    _myState.selectionModels[charts.SelectionModelType.info] =
        charts.UserManagedSelectionModel(model: model);
  }

  void _handleClearSelection() {
    // Call set state to request a rebuild, to pass in the modified selection.
    // In this case, passing in an empty [UserManagedSelectionModel] creates a
    // no selection model to clear all selection when rebuilt.
    setState(() {
      _myState.selectionModels[charts.SelectionModelType.info] =
          charts.UserManagedSelectionModel();
    });
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
