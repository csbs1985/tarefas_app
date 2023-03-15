import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_padding.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class SelectInput extends StatefulWidget {
  const SelectInput({
    required TextEditingController controller,
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
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  List<bool> _selections = [];

  @override
  void initState() {
    super.initState();
    _selections = List.generate(widget._body.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    bool _checkSelected(int value) {
      return widget._controller.text == value ? true : false;
    }

    void selectButton(Map<String, dynamic> button) {
      // setState(() {
      //   listSelect.contains(button['value'])
      //       ? listSelect.remove(button['value'])
      //       : listSelect.add(button['value']);
      widget._callback(button);
      // });
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: UiColor.border,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget._label,
              style: UiText.headline2,
            ),
            SizedBox(height: UiPadding.medium),
            Wrap(
              spacing: 8,
              children: [
                for (var item in widget._body)
                  TextButton(
                    child: Text(
                      item.text,
                      style: _checkSelected(item.value)
                          ? UiText.buttonSelected
                          : UiText.button,
                    ),
                    onPressed: () => widget._callback(item),
                    style: _checkSelected(item.value)
                        ? UiButton.buttonSelected
                        : UiButton.button,
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
