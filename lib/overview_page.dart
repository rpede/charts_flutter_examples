import 'package:flutter/material.dart';

import 'routing.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = examplesExtended.entries.toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Overview")),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 4,
        children: [
          for (final entry in entries)
            ExampleTile(entry: entry)
        ],
      ),
    );
  }
}

class ExampleTile extends StatelessWidget {
  const ExampleTile({
    super.key,
    required this.entry,
  });

  final MapEntry<String, ExampleDef> entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: GridTile(
          key: ValueKey(entry),
          header: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Center(child: Text(entry.value.title)),
          ),
          child: Image.asset(entry.value.image),
        ),
        onTap: () => Navigator.of(context).pushNamed(entry.key),
      ),
    );
  }
}
