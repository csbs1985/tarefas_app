import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({
    super.key,
    required Function callback,
    required String label,
    required TextEditingController controller,
  })  : _callback = callback,
        _label = label,
        _controller = controller;

  final Function _callback;
  final String _label;
  final TextEditingController _controller;

  @override
  State<AmountInput> createState() => _AmountInputState();
}

class _AmountInputState extends State<AmountInput> {
  final NumberFormat _numberFormat = NumberFormat("#,##0.00", "pt_BR");

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
                TextFormField(
                  controller: widget._controller,
                  style: UiText.headline1,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: widget._label,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      final num parsed = _numberFormat.parse(newValue.text);
                      return parsed != null
                          ? TextEditingValue(text: _numberFormat.format(parsed))
                          : newValue;
                    }),
                  ],
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
