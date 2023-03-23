import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/calendar_widget.dart';

import '../widget/hour_widget.dart';

class NotificacaoModal extends StatefulWidget {
  const NotificacaoModal({
    super.key,
    required controller,
    required Function callback,
  })  : _controller = controller,
        _callback = callback;

  final TextEditingController _controller;
  final Function _callback;

  @override
  State<NotificacaoModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<NotificacaoModal> {
  late String _date;
  late String _hour;

  void _setDate(String value) {
    _date = value;
  }

  void _setHour(String value) {
    _hour = value;
  }

  void _confirm() {
    if (_date != "" && _hour != "") widget._callback('_date - _hour');

    Navigator.of(context).pop();
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
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
                child: Text(
                  NOTIFICACAO,
                  style: UiText.headline2,
                ),
              ),
              CalendarWidget(
                controller: widget._controller,
                callback: (value) => _setDate(value),
              ),
              HourWidget(
                controller: widget._controller,
                callback: (value) => _setHour(value),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        elevation: 0,
        onPressed: () => _confirm(),
        child: SvgPicture.asset(UiSvg.confirm),
      ),
    );
  }
}
