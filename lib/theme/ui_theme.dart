import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiTheme {
  static ThemeData theme1 = ThemeData(
    scaffoldBackgroundColor: UiColor.back,
    fontFamily: 'nunito-regular',
    appBarTheme: const AppBarTheme(backgroundColor: UiColor.back, elevation: 0),
    // inputDecorationTheme: UiTextFormField.primary,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: UiColor.planning),
  );
}
