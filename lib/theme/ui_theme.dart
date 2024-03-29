import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text_form_field.dart';

class UiTheme {
  static ThemeData theme1 = ThemeData(
    scaffoldBackgroundColor: UiColor.background,
    fontFamily: 'ElementalSansPro',
    appBarTheme: const AppBarTheme(
      backgroundColor: UiColor.background,
      elevation: 0,
    ),
    inputDecorationTheme: UiTextField.textField,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: UiColor.planejados),
  );
}
