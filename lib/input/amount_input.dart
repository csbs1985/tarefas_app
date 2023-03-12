import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class AmountInput extends StatefulWidget {
  const AmountInput({
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
  final format = FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'));
  final real = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    controller.addListener(() {
      final centavos =
          int.tryParse(controller.text.replaceAll(RegExp('[^0-9]'), ''));
      if (centavos != null) {
        final valor = centavos / 100.0;
        final valorFormatado = real.format(valor);
        if (valorFormatado != controller.text) {
          controller.value = TextEditingValue(
            text: valorFormatado,
            selection: TextSelection.collapsed(offset: valorFormatado.length),
          );
        }
      }
    });

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
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: widget._label,
                  prefixText: 'R\$ ',
                ),
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    final parsed = real.parse(newValue.text);
                    return TextEditingValue(
                      text: real.format(parsed).replaceFirst('R\$', '').trim(),
                      selection: TextSelection.collapsed(
                        offset: real.format(parsed).length,
                      ),
                    );
                  }),
                ],
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                UiSvg.clean,
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
