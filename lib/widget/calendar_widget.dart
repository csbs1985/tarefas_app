import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    Key? key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback,
        super(key: key);

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final _minSelectedDate = DateTime(1950, 1, 1, 0, 0, 0);
  final _maxSelectedDate = DateTime(2050, 12, 31, 0, 0, 0);

  void _selectDay(DateTime date, List<Event> events) {
    setState(() {
      String dataString = DateFormat('dd/MM/yyyy').format(date);

      widget._controller.text = dataString;
      widget._callback(dataString);
    });
  }

  _selectedDateTime() {
    if (widget._controller.text != "") {
      String dateString = widget._controller.text;
      DateTime dataHora = DateTime.parse(
          "${dateString.split("/")[2]}-${dateString.split("/")[1]}-${dateString.split("/")[0]}");
      return dataHora;
    }
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
          onDayPressed: (DateTime date, List<Event> events) =>
              _selectDay(date, events),
        ),
      ],
    );
  }
}
