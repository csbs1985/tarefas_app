import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class HourWidget extends StatefulWidget {
  const HourWidget({
    Key? key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller,
        super(key: key);

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<HourWidget> createState() => _HourWidgetState();
}

class _HourWidgetState extends State<HourWidget> {
  DateTime now = DateTime.now();

  final int _dividedHours = 24;
  final int _dividedMinutes = 60;

  late int _hour = now.hour;
  late int _minute = now.minute;

  final int _divisions = 288;

  @override
  void initState() {
    super.initState();
    _updateClock(_hour, _minute);
  }

  _updateClock(int hour, int minute) {
    setState(() {
      _hour = hour;
      _minute = minute;
    });

    widget._callback('$_hour:$_minute');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.back,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 16, 0, 24),
              child: Text(
                HORA_SELECIONE,
                style: UiText.headline2,
              ),
            ),
            DoubleCircularSlider(
              24,
              0,
              10,
              width: MediaQuery.of(context).size.width,
              primarySectors: _dividedHours,
              secondarySectors: _dividedMinutes,
              baseColor: const Color.fromRGBO(255, 255, 255, 0.1),
              selectionColor: const Color.fromRGBO(255, 255, 255, 0.3),
              handlerColor: UiColor.task,
              shouldCountLaps: true,
              onSelectionChange: (int hour, int minute, int laps) =>
                  _updateClock(hour, minute),
              child: Padding(
                padding: const EdgeInsets.all(42.0),
                child: Center(
                  child: Text(
                    '${_hour}h${_minute}m',
                    style: UiText.headline6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
