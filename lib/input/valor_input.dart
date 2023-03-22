import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class ValorInput extends StatefulWidget {
  const ValorInput({
    super.key,
    required Function callback,
    required MoneyMaskedTextController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final MoneyMaskedTextController _controller;

  @override
  State<ValorInput> createState() => _ValorInputState();
}

class _ValorInputState extends State<ValorInput> {
  void getValor() async {
    widget._callback(widget._controller);
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
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    VALOR,
                    style: UiText.headline2,
                  ),
                ),
                TextField(
                  controller: widget._controller,
                  style: UiText.headline1,
                  onSubmitted: (value) => getValor(),
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(hintText: VALOR_SIMBOLO_REAL),
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
