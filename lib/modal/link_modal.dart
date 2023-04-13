import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/input/texto_input.dart';
import 'package:tarefas_app/theme/ui_button.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';
import 'package:tarefas_app/widget/toast_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkModal extends StatefulWidget {
  const LinkModal({
    super.key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller;

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<LinkModal> createState() => _AddressModalState();
}

class _AddressModalState extends State<LinkModal> {
  final ToastWidget _toast = ToastWidget();

  void _copyToClipboard() {
    if (widget._controller.text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: widget._controller.text));
      _toast.toast(context, ToastEnum.SUCESSO.value, COPIAR_SUCESSO);
    } else
      _toast.toast(context, ToastEnum.ERRO.value, LINK_VAZIO);
  }

  void _openLink() async {
    if (widget._controller.text != "")
      launchUrl(Uri.parse(widget._controller.text));
    else
      _toast.toast(context, ToastEnum.ERRO.value, LINK_VAZIO);
  }

  void _setText() {
    if (isValidUrl(widget._controller.text)) {
      widget._callback(widget._controller.text);
      Navigator.of(context).pop();
    } else
      _toast.toast(context, ToastEnum.ERRO.value, LINK_ERRO);
  }

  bool isValidUrl(String url) {
    bool isValid = Uri.parse(url).isAbsolute;
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 16),
              child: Text(
                LINK_DIGITE,
                style: UiText.headline2,
              ),
            ),
            Flexible(
              child: ListView(
                children: [
                  TextoInput(
                    controller: widget._controller,
                    label: LINK,
                    callback: (value) => widget._controller.text = value,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => _copyToClipboard(),
                        style: UiButton.buttonSecondary,
                        child: const Text(
                          LINK_COPIAR,
                          style: UiText.buttonSecondary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      TextButton(
                        onPressed: () => _openLink(),
                        style: UiButton.buttonSecondary,
                        child: const Text(
                          LINK_ABRIR,
                          style: UiText.buttonSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.tarefa,
        elevation: 0,
        onPressed: () => _setText(),
        child: SvgPicture.asset(UiSvg.confirmar),
      ),
    );
  }
}
