import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiTheme {
  static ThemeData theme1 = ThemeData(
    scaffoldBackgroundColor: UiColor.back,
    fontFamily: 'ElementalSansPro',
    appBarTheme: const AppBarTheme(
      backgroundColor: UiColor.back,
      elevation: 0,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: UiColor.planning),
    // inputDecorationTheme: UiTextFormField.primary,
  );
}
