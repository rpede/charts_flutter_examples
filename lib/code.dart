import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:highlight/languages/dart.dart';

class CodeLoader extends StatelessWidget {
  final String asset;
  final Widget Function(String code) builder;
  const CodeLoader({super.key, required this.asset, required this.builder});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rootBundle.loadString("lib/examples/simple_time_series.dart"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(snapshot.data!);
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error!);
        } else {
          return const LinearProgressIndicator();
        }
      },
    );
  }
}

class CodeViewer extends StatefulWidget {
  final String code;
  const CodeViewer(this.code, {super.key});

  @override
  State<CodeViewer> createState() => _CodeViewerState();
}

class _CodeViewerState extends State<CodeViewer> {
  late CodeController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      text: widget.code,
      language: dart,
      params: const EditorParams(tabSpaces: 2),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CodeTheme(
      data: const CodeThemeData(styles: androidstudioTheme),
      child: CodeField(
        controller: _codeController,
        readOnly: true,
        textStyle: const TextStyle(fontFamily: 'SourceCodePro'),
      ),
    );
  }
}