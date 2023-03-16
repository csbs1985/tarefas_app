import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiButton {
  static ButtonStyle button = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(UiColor.button),
    minimumSize: MaterialStateProperty.all<Size>(Size(48, 48)),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
    ),
  );

  static ButtonStyle buttonSelected = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll<Color>(UiColor.buttonSelected),
    minimumSize: MaterialStateProperty.all<Size>(Size(48, 48)),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
    ),
  );
}
