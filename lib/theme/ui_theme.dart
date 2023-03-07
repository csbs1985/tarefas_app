import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text_form_field.dart';

class UiTheme {
  static ThemeData theme1 = ThemeData(
    scaffoldBackgroundColor: UiColor.back,
    fontFamily: 'ElementalSansPro',
    appBarTheme: const AppBarTheme(
      backgroundColor: UiColor.back,
      elevation: 0,
    ),
    inputDecorationTheme: UiTextField.textField,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: UiColor.planning),
  );
}
