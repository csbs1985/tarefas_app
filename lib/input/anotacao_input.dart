import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/modals/anotacao_modal.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class AnotacaoInput extends StatefulWidget {
  const AnotacaoInput({
    Key? key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller,
        super(key: key);

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<AnotacaoInput> createState() => _AnotacaoInputState();
}

class _AnotacaoInputState extends State<AnotacaoInput> {
  void _openModal() {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      barrierColor: UiColor.overlay,
      duration: const Duration(milliseconds: 300),
      builder: (context) => AnotacaoModal(
        controller: widget._controller,
        callback: (value) => _setControllerModal(value),
      ),
    );
  }

  void _setControllerModal(String value) {
    setState(() {
      widget._controller.text = value;
      widget._callback(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: UiBorder.borda,
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () => _openModal(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(ANOTACAO, style: UiText.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                      child: Text(
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        widget._controller.text.isNotEmpty
                            ? widget._controller.text
                            : ANOTACAO_DIGITE,
                        style: widget._controller.text.isNotEmpty
                            ? UiText.headline1
                            : UiText.headline3,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: SvgPicture.asset(
                    UiSvg.limpar,
                    height: 20,
                    color: UiColor.icon,
                  ),
                  onPressed: () => _setControllerModal(''),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
