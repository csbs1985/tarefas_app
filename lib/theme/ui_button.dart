import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class UiButton {
  static ButtonStyle button = ButtonStyle(
    backgroundColor: const MaterialStatePropertyAll<Color>(UiColor.button),
    minimumSize: MaterialStateProperty.all<Size>(const Size(48, 48)),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
    ),
  );

  static ButtonStyle buttonSelected = ButtonStyle(
    backgroundColor:
        const MaterialStatePropertyAll<Color>(UiColor.buttonSelected),
    minimumSize: MaterialStateProperty.all<Size>(const Size(48, 48)),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
    ),
  );

  static ButtonStyle buttonSecondary = ButtonStyle(
    backgroundColor:
        const MaterialStatePropertyAll<Color>(UiColor.buttonSecondary),
    minimumSize: MaterialStateProperty.all<Size>(const Size(48, 48)),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiBorder.rounded),
      ),
    ),
  );
}
