import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

ValueNotifier<int> currentPageInt = ValueNotifier<int>(0);

class PageClass {
  final Map<PageEnum, Map<String, dynamic>> pageMap = {
    PageEnum.planejados: {
      'text': PLANEJADOS,
      'color': UiColor.planejados,
      'style': UiText.planejados,
    },
    PageEnum.calendario: {
      'text': CALENDARIO,
      'color': UiColor.calendario,
      'style': UiText.calendario,
    },
    PageEnum.todas: {
      'text': TODAS,
      'color': UiColor.todas,
      'style': UiText.todas,
    },
    PageEnum.concluidas: {
      'text': CONCLUIDAS,
      'color': UiColor.concluidas,
      'style': UiText.concluidas,
    },
    PageEnum.tarefa: {
      'text': TAREFA,
      'color': UiColor.tarefa,
      'style': UiText.tarefa,
    },
  };

  String getText(PageEnum page) {
    return pageMap[page]!['text'];
  }

  TextStyle getStyle(PageEnum page) {
    return pageMap[page]!['style'];
  }
}

enum PageEnum {
  planejados(0),
  calendario(1),
  todas(2),
  concluidas(3),
  tarefa(4);

  final int value;
  const PageEnum(this.value);
}
