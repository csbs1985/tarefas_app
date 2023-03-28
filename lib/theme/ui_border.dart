import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiBorder {
  static const double circle = 40;
  static const double none = 0;
  static const double rounded = 6;

  static BoxDecoration borda = const BoxDecoration(
    border: Border(
      top: BorderSide(
        width: 1,
        color: UiColor.border,
      ),
    ),
  );
}
