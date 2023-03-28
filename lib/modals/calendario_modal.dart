import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/widget/calendar_widget.dart';

class CalendarioModal extends StatefulWidget {
  const CalendarioModal({
    super.key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<CalendarioModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<CalendarioModal> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CalendarWidget(
                controller: widget._controller,
                callback: (value) => _setControllerModal(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
