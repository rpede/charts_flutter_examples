import 'package:charts_flutter_examples/code.dart';
import 'package:charts_flutter_examples/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_split_view/multi_split_view.dart';

class ExamplePage extends StatefulWidget {
  final ExampleDef example;
  const ExamplePage(this.example, {super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.example.title)),
      body: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(dividerThickness: 24),
        child: MultiSplitView(
          dividerBuilder:
              (axis, index, resizable, dragging, highlighted, themeData) =>
                  Container(
            color: dragging ? Colors.grey[300] : Colors.grey[100],
            child: Icon(
              Icons.drag_indicator,
              color: highlighted ? Colors.grey[600] : Colors.grey[400],
            ),
          ),
          children: [
            Code(asset: widget.example.code),
            widget.example.builder.call(),
          ],
        ),
      ),
    );
  }
}
