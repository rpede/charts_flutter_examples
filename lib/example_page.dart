import 'package:charts_flutter_examples/code.dart';
import 'package:charts_flutter_examples/routing.dart';
import 'package:charts_flutter_examples/theme_changer.dart';
import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;
    final aspect = size.width / size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.example.title),
        actions: const [ThemeChanger()],
      ),
      body: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(dividerThickness: 24),
        child: MultiSplitView(
          axis: aspect > 1 ? Axis.horizontal : Axis.vertical,
          dividerBuilder:
              (axis, index, resizable, dragging, highlighted, themeData) =>
                  Container(
            child: Icon(
              Icons.drag_indicator,
              color: highlighted ? Colors.blueGrey : Colors.grey[500],
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
