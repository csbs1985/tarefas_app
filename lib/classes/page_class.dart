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
      'style': UiText.tituloPlanejados,
    },
    PageEnum.calendario: {
      'text': CALENDARIO,
      'color': UiColor.calendario,
      'style': UiText.tituloCalendario,
    },
    PageEnum.todas: {
      'text': TODAS,
      'color': UiColor.todas,
      'style': UiText.tituloTodas,
    },
    PageEnum.concluidas: {
      'text': CONCLUIDAS,
      'color': UiColor.concluidas,
      'style': UiText.tituloConcluidas,
    },
    PageEnum.tarefa: {
      'text': TAREFA,
      'color': UiColor.tarefa,
      'style': UiText.tituloTarefa,
    },
  };

  String getIcon(PageEnum page) {
    return pageMap[page]!['icon'];
  }

  String getText(PageEnum page) {
    return pageMap[page]!['text'];
  }

  TextStyle getStyle(PageEnum page) {
    return pageMap[page]!['style'];
  }

  Color getColor(PageEnum page) {
    return pageMap[page]!['color'];
  }

  Color getColorInt(int page) {
    if (page == 0) return UiColor.planejados;
    if (page == 1) return UiColor.calendario;
    if (page == 2) return UiColor.todas;
    if (page == 3) return UiColor.concluidas;
    return UiColor.tarefa;
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
