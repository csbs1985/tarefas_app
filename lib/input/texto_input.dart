import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/buttons/limpar_button.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class TextoInput extends StatefulWidget {
  const TextoInput({
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
  State<TextoInput> createState() => _TextoInputState();
}

class _TextoInputState extends State<TextoInput> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: UiBorder.borda,
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
                ),
              ],
            ),
          ),
          LimparButton(callback: (value) => widget._controller.clear()),
        ],
      ),
    );
  }
}
