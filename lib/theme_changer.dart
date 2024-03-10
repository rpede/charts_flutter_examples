import 'package:charts_flutter_examples/main.dart';
import 'package:flutter/material.dart';

class ThemeChanger extends StatelessWidget {
  const ThemeChanger({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      selectedItemBuilder: (context) => [
        for (final icon in [
          Icons.invert_colors,
          Icons.dark_mode,
          Icons.light_mode,
        ])
          Icon(icon)
      ],
      value: MyApp.themeNotifier.value,
      items: [
        for (final (mode, icon) in [
          (ThemeMode.system, Icons.invert_colors),
          (ThemeMode.dark, Icons.dark_mode),
          (ThemeMode.light, Icons.light_mode),
        ])
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
