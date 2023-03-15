import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/theme/ui_color.dart';
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
    return Container(
      decoration: BoxDecoration(
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
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    widget._label,
                    style: UiText.headline2,
                  ),
                ),
                TextFormField(
                  controller: widget._controller,
                  style: UiText.headline1,
                  keyboardType: widget._keyboard,
                  decoration: InputDecoration(hintText: widget._label),
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
