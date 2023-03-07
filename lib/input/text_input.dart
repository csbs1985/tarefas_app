import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    required Function callback,
    required String label,
    required TextEditingController controller,
    TextInputType keyboard = TextInputType.text,
  })  : _callback = callback,
        _label = label,
        _controller = controller,
        _keyboard = keyboard;

  final Function _callback;
  final String _label;
  final TextEditingController _controller;
  final TextInputType _keyboard;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget._label,
            style: UiText.headline2,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget._controller,
                style: UiText.headline1,
                keyboardType: widget._keyboard,
                decoration: InputDecoration(hintText: widget._label),
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                UiSvg.close,
                height: 16,
              ),
              onPressed: () => widget._controller.clear(),
            ),
          ],
        ),
      ],
    );
  }
}
