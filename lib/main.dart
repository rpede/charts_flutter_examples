import 'package:flutter/material.dart';

import 'routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Charts Examples',
      initialRoute: '/',
      routes: routes,
    );
  }
}
