import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class UiTextField {
  static final InputDecorationTheme textField = InputDecorationTheme(
    hintStyle: UiText.headline3,
    contentPadding: EdgeInsets.zero,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: UiColor.input),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: UiColor.input),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: UiColor.input),
    ),
  );
}
