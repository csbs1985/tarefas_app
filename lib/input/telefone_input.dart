import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class TelefoneInput extends StatefulWidget {
  const TelefoneInput({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;

  final TextEditingController _controller;

  @override
  State<TelefoneInput> createState() => _TelefoneInputState();
}

class _TelefoneInputState extends State<TelefoneInput> {
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
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    TELEFONE,
                    style: UiText.headline2,
                  ),
                ),
                TextField(
                  controller: widget._controller,
                  style: UiText.headline1,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => _input = value,
                  decoration: const InputDecoration(hintText: TELEFONE),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
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
