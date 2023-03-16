import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final _minSelectedDate = DateTime(1950, 1, 1, 0, 0, 0);
  final _maxSelectedDate = DateTime(2050, 12, 31, 0, 0, 0);

  void _selectDay(DateTime date, List<Event> events) {
    this.setState(() {
      String dataString = DateFormat('dd/MM/yyyy HH:mm:ss').format(date);

      widget._controller.text = dataString;
      widget._callback(dataString);

      // Navigator.of(context).pop();
    });
  }

  _selectedDateTime() {
    if (widget._controller.text.isNotEmpty) {
      DateTime dataHora =
          DateFormat('dd/MM/yyyy HH:mm:ss').parse(widget._controller.text);
      return dataHora;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel(
      locale: 'pt_BR',
      minSelectedDate: _minSelectedDate,
      maxSelectedDate: _maxSelectedDate,
      selectedDateTime: _selectedDateTime(),
      headerTextStyle: UiText.headline2,
      weekendTextStyle: UiText.headline3,
      daysTextStyle: UiText.headline1,
      weekdayTextStyle: UiText.headline3,
      selectedDayTextStyle: UiText.headline4,
      iconColor: UiColor.task,
      todayTextStyle: UiText.headline4,
      todayBorderColor: Colors.transparent,
      todayButtonColor: UiColor.element,
      selectedDayBorderColor: Colors.transparent,
      selectedDayButtonColor: UiColor.task,
      height: 400,
      daysHaveCircularBorder: false,
      markedDateCustomShapeBorder:
          BeveledRectangleBorder(borderRadius: BorderRadius.circular(6)),
      onDayPressed: (DateTime date, List<Event> events) =>
          _selectDay(date, events),
    );
  }
}
