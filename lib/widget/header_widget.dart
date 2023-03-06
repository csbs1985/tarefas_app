import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tarefas_app/enuns/page_enum.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    required PageEnum page,
  }) : _page = page;

  final PageEnum _page;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final Map<PageEnum, Map<String, dynamic>> _pageMap = {
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

  String getText(PageEnum page) {
    return _pageMap[page]!['text'];
  }

  String getIcon(PageEnum page) {
    return _pageMap[page]!['icon'];
  }

  Color getColor(PageEnum page) {
    return _pageMap[page]!['color'];
  }

  TextStyle getStyle(PageEnum page) {
    return _pageMap[page]!['style'];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            SvgPicture.asset(
              getIcon(widget._page),
              color: getColor(widget._page),
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(getText(widget._page), style: getStyle(widget._page)),
          ],
        ),
      ),
    );
  }
}
