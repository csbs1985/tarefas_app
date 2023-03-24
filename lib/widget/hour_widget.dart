import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:intl/intl.dart';
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
  String label = '';

  @override
  void initState() {
    super.initState();
    DateTime agora = DateTime.now();
    print(agora);
  }

  onDragging(int minutes) {
    final date = DateTime.utc(2023, 1, 1).add(Duration(minutes: minutes));
    final dateFormatter = DateFormat('HH\'h\'mm\'m\'');

    setState(() => label = dateFormatter.format(date));
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
            Center(
              child: Text(
                label,
                style: UiText.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FlutterSlider(
                values: const [1],
                max: 1440,
                min: 1,
                handlerWidth: 24,
                handlerHeight: 24,
                handler: FlutterSliderHandler(
                  decoration: const BoxDecoration(),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: UiColor.task,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                selectByTap: true,
                onDragging: (handlerIndex, lowerValue, upperValue) =>
                    onDragging(lowerValue.toInt()),
                onDragStarted: (handlerIndex, lowerValue, upperValue) {},
                tooltip: FlutterSliderTooltip(disabled: true),
                trackBar: FlutterSliderTrackBar(
                  inactiveTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: UiColor.element,
                  ),
                  activeTrackBar: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: UiColor.element,
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
