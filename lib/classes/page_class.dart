import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

ValueNotifier<int> currentPageInt = ValueNotifier<int>(0);

class PageClass {
  final Map<PageEnum, Map<String, dynamic>> pageMap = {
    PageEnum.planning: {
      'text': 'Planejamento',
      'color': UiColor.planning,
      'style': UiText.titlePlanning,
    },
    PageEnum.calendar: {
      'text': 'Calendário',
      'color': UiColor.calendar,
      'style': UiText.titleCalendar,
    },
    PageEnum.all: {
      'text': 'Todos',
      'color': UiColor.all,
      'style': UiText.titleAll,
    },
    PageEnum.concluded: {
      'text': 'Concluidas',
      'color': UiColor.concluded,
      'style': UiText.titleConcluded,
    },
    PageEnum.tarefa: {
      'text': 'Tarefa',
      'color': UiColor.tarefa,
      'style': UiText.titleTarefa,
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
    if (page == 0) return UiColor.planning;
    if (page == 1) return UiColor.calendar;
    if (page == 2) return UiColor.all;
    if (page == 3) return UiColor.concluded;
    return UiColor.tarefa;
  }
}

enum PageEnum {
  planning(0),
  calendar(1),
  all(2),
  concluded(3),
  tarefa(4);

  final int value;
  const PageEnum(this.value);
}
