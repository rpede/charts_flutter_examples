import 'package:charts_flutter_examples/code.dart';
import 'package:charts_flutter_examples/routing.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  final ExampleDef example;
  const ExamplePage(this.example, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(example.title)),
      body: SingleChildScrollView(
        child: CodeLoader(
          asset: example.code,
          builder: (code) => CodeViewer(code),
        ),
      ),
    );
  }
}
