import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/tomorrow.dart';
import 'package:highlight/languages/dart.dart';

class Code extends StatelessWidget {
  const Code({super.key, required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return CodeLoader(
      asset: asset,
      builder: (code) => SingleChildScrollView(child: CodeView(code)),
    );
  }
}

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

class CodeView extends StatefulWidget {
  final String code;
  const CodeView(this.code, {super.key});

  @override
  State<CodeView> createState() => _CodeViewState();
}

class _CodeViewState extends State<CodeView> {
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
      data: CodeThemeData(styles: themes[Theme.of(context).brightness]!),
      child: CodeField(
        controller: _codeController,
        readOnly: true,
        textStyle: const TextStyle(fontFamily: 'SourceCodePro'),
      ),
    );
  }
}

const themes = {
  Brightness.dark: androidstudioTheme,
  Brightness.light: tomorrowTheme
};
