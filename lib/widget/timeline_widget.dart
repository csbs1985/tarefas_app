import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class TimelineWidget extends StatefulWidget {
  const TimelineWidget({
    Key? key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback,
        super(key: key);

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<TimelineWidget> createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  void _selectDay(DateTime date) {
    setState(() {
      widget._controller.text = date.toString();
      widget._callback(date.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
      initialDate: DateTime.parse(widget._controller.text),
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime(2050, 12, 31),
      onDateSelected: (date) => _selectDay(date),
      leftMargin: 16,
      monthColor: UiColor.text_2,
      dayColor: UiColor.text_2,
      activeDayColor: Colors.black,
      activeBackgroundDayColor: UiColor.calendario,
      locale: 'pt_BR',
    );
  }
}
