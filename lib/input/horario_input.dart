import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/modals/horario_modal.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class HorarioInput extends StatefulWidget {
  const HorarioInput({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;

  final TextEditingController _controller;

  @override
  State<HorarioInput> createState() => _HorarioInputState();
}

class _HorarioInputState extends State<HorarioInput> {
  void _openModal() {
    showDialog(
      context: context,
      barrierColor: UiColor.overlay,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: UiColor.back,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UiBorder.rounded),
        ),
        content: HorarioModal(
          controller: widget._controller,
          callback: (value) => _setControllerModal(value),
        ),
      ),
    );
  }

  void _setControllerModal(String value) {
    setState(() {
      widget._controller.text = value;
      widget._callback(value);

      Navigator.of(context).pop();
    });
  }

  void _clear() {
    setState(() {
      widget._controller.text = '';
      widget._callback('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: UiBorder.borda,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () => _openModal(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(HORARIO, style: UiText.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                      child: Text(
                        widget._controller.text.isNotEmpty
                            ? widget._controller.text
                            : SELECIONE,
                        style: widget._controller.text.isNotEmpty
                            ? UiText.headline1
                            : UiText.headline3,
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                splashColor: Colors.transparent,
                icon: SvgPicture.asset(
                  UiSvg.clean,
                  height: 20,
                  color: UiColor.icon,
                ),
                onPressed: () => _clear(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
