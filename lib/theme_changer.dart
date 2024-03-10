import 'package:charts_flutter_examples/main.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    final modes = [
      (ThemeMode.system, Icons.invert_colors),
      (ThemeMode.dark, Icons.dark_mode),
      (ThemeMode.light, Icons.light_mode),
    ];
    return DropdownButton(
      value: MyApp.themeNotifier.value,
      selectedItemBuilder: (context) => [
        for (final (_, icon) in modes) Icon(icon),
      ],
      items: [
        for (final (mode, icon) in modes)
          DropdownMenuItem(
            value: mode,
            child: Row(
              children: [
                Icon(icon),
                const SizedBox(width: 8),
                Text(mode.name),
              ],
            ),
          ),
      ],
      onChanged: (value) {
        MyApp.themeNotifier.value = value as ThemeMode;
      },
    );
  }
}
