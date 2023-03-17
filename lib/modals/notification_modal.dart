import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/calendar_widget.dart';
import 'package:tarefas_app/widget/hour_widget.dart';

class NotificationModal extends StatefulWidget {
  const NotificationModal({
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<NotificationModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<NotificationModal> {
  void _setControllerModal(String value) {
    setState(() {
      widget._controller.text = value;
      widget._callback(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CalendarWidget(
                controller: widget._controller,
                callback: (value) => _setControllerModal(value),
              ),
              const HourWidget()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        elevation: 0,
        onPressed: () => Navigator.of(context).pop(),
        child: SvgPicture.asset(UiSvg.create),
      ),
    );
  }
}
