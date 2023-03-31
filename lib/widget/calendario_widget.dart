import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:tarefas_app/classes/calendario_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class CalendarioWidget extends StatefulWidget {
  const CalendarioWidget({
    Key? key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback,
        super(key: key);

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<CalendarioWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarioWidget> {
  final CalendarioClasss _calendarioClasss = CalendarioClasss();

  final _minSelectedDate = DateTime(1950, 1, 1, 0, 0, 0);
  final _maxSelectedDate = DateTime(2050, 12, 31, 0, 0, 0);

  void _selectDay(DateTime date, List<Event> events) {
    setState(() {
      widget._controller.text = date.toString();
      widget._callback(date.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
          child: Text(DIA_SELECIONE, style: UiText.headline2),
        ),
        CalendarCarousel(
          height: 360,
          locale: 'pt_BR',
          minSelectedDate: _minSelectedDate,
          maxSelectedDate: _maxSelectedDate,
          selectedDateTime:
              _calendarioClasss.stringToDatetime(widget._controller.text),
          headerTextStyle: UiText.headline2,
          weekendTextStyle: UiText.headline3,
          daysTextStyle: UiText.headline1,
          weekdayTextStyle: UiText.headline3,
          selectedDayTextStyle: UiText.headline4,
          iconColor: UiColor.tarefa,
          todayTextStyle: UiText.headline4,
          todayBorderColor: Colors.transparent,
          todayButtonColor: UiColor.element,
          selectedDayBorderColor: Colors.transparent,
          selectedDayButtonColor: UiColor.tarefa,
          daysHaveCircularBorder: false,
          onDayPressed: (DateTime date, List<Event> events) =>
              _selectDay(date, events),
        ),
      ],
    );
  }
}
