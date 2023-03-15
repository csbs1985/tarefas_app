import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiButton {
  static ButtonStyle button = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(UiColor.button),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
    ),
  );

  static ButtonStyle buttonSelected = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(UiColor.buttonSelected),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
    ),
  );
}
