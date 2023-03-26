import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/classes/endereco_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/modals/link_modal.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class LinkInput extends StatefulWidget {
  const LinkInput({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<LinkInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<LinkInput> {
  final EnderecoClass _enderecoClass = EnderecoClass();

  void _openModal() {
    showCupertinoModalBottomSheet(
      expand: false,
      context: context,
      barrierColor: UiColor.overlay,
      duration: const Duration(milliseconds: 300),
      builder: (context) => LinkModal(
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
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: UiColor.border,
            ),
          ),
        ),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () => _openModal(),
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
                      child: Text(LINK, style: UiText.headline2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
                      child: Text(
                        widget._controller.text.isNotEmpty
                            ? widget._controller.text
                            : SELECIONE,
                        style: widget._controller.text.isNotEmpty
                            ? UiText.link
                            : UiText.headline3,
                      ),
                    )
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
                onPressed: () => _setControllerModal(''),
              )
            ],
          ),
        ),
      ),
    );
  }
}
