import 'package:flutter/material.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/calendar_widget.dart';

class CalendarModal extends StatefulWidget {
  const CalendarModal({
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<CalendarModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<CalendarModal> {
  void _setControllerModal(String value) {
    setState(() {
      widget._controller.text = value;
      widget._callback(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.back,
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                  child: Text(DIA_SELECT, style: UiText.headline2),
                ),
                CalendarWidget(
                  controller: widget._controller,
                  callback: (value) => _setControllerModal(value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
