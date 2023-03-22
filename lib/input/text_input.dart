import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required Function callback,
    required String label,
    required TextEditingController controller,
    int? maxLength,
    TextInputType keyboard = TextInputType.text,
  })  : _callback = callback,
        _label = label,
        _controller = controller,
        _keyboard = keyboard,
        _maxLength = maxLength;

  final Function _callback;
  final String _label;
  final TextEditingController _controller;
  final TextInputType _keyboard;
  final int? _maxLength;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String _input = '';

  List<TextInputFormatter> _getInputFormatter() {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: UiColor.border,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    widget._label,
                    style: UiText.headline2,
                  ),
                ),
                TextField(
                  controller: widget._controller,
                  style: UiText.headline1,
                  keyboardType: widget._keyboard,
                  maxLength: widget._maxLength,
                  onChanged: (value) => _input = value,
                  decoration: InputDecoration(hintText: widget._label),
                  inputFormatters: _getInputFormatter(),
                ),
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
            onPressed: () => widget._controller.clear(),
          )
        ],
      ),
    );
  }
}
