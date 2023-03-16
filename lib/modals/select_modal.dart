import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class SelectModal extends StatefulWidget {
  const SelectModal({
    required controller,
    required List body,
    required String label,
    required Function callback,
  })  : _controller = controller,
        _body = body,
        _label = label,
        _callback = callback;

  final TextEditingController _controller;
  final List _body;
  final String _label;
  final Function _callback;

  @override
  State<SelectModal> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectModal> {
  void selectButton(button) {
    setState(() {
      widget._controller.text = button.text;
      widget._callback(button.text);

      Navigator.of(context).pop();
    });
  }

  bool _checkSelected(String text) {
    return widget._controller.text == text ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor.back,
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                  child: Text(widget._label, style: UiText.headline2),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (var item in widget._body)
                      TextButton(
                        onPressed: () => selectButton(item),
                        child: Text(
                          item.text,
                          style: _checkSelected(item.text)
                              ? UiText.buttonSelected
                              : UiText.button,
                        ),
                        style: _checkSelected(item.text)
                            ? UiButton.buttonSelected
                            : UiButton.button,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
