import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

ValueNotifier<int> currentPageInt = ValueNotifier<int>(0);

class PageClass {
  final Map<PageEnum, Map<String, dynamic>> pageMap = {
    PageEnum.planning: {
      'text': 'Planejamento',
      'icon': UiSvg.planning,
      'color': UiColor.planning,
      'style': UiText.titlePlanning,
    },
    PageEnum.calendar: {
      'text': 'Calendário',
      'icon': UiSvg.calendar,
      'color': UiColor.calendar,
      'style': UiText.titleCalendar,
    },
    PageEnum.all: {
      'text': 'Todos',
      'icon': UiSvg.all,
      'color': UiColor.all,
      'style': UiText.titleAll,
    },
    PageEnum.concluded: {
      'text': 'Concluidas',
      'icon': UiSvg.concluded,
      'color': UiColor.concluded,
      'style': UiText.titleConcluded,
    },
    PageEnum.task: {
      'text': 'Tarefa',
      'icon': UiSvg.back,
      'color': UiColor.task,
      'style': UiText.titleTask,
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
    return UiColor.task;
  }
}

enum PageEnum {
  planning(0),
  calendar(1),
  all(2),
  concluded(3),
  task(4);

  final int value;
  const PageEnum(this.value);
}
