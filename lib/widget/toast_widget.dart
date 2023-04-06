import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class ToastWidget {
  void toast(BuildContext context, String? type, String text) {
    Color style = UiColor.alerta;

    if (type == ToastEnum.SUCESSO.value)
      style = UiColor.sucesso;
    else if (type == ToastEnum.ERRO.value)
      style = UiColor.erro;
    else
      style = UiColor.alerta;

    showToast(
      text,
      context: context,
      duration: const Duration(seconds: 3),
      position: StyledToastPosition.center,
      textStyle: UiText.headline5,
      backgroundColor: style,
      animation: StyledToastAnimation.slideToBottomFade,
      reverseAnimation: StyledToastAnimation.slideFromBottomFade,
      borderRadius: BorderRadius.circular(UiBorder.rounded),
      animDuration: const Duration(milliseconds: 1),
    );
  }
}

enum ToastEnum {
  ALERTA('alerta'),
  SUCESSO('sucesso'),
  ERRO('erro');

  final String value;
  const ToastEnum(this.value);
}
