import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class NotesModal extends StatefulWidget {
  const NotesModal({
    Key? key,
    required Function callback,
    required TextEditingController controller,
  })  : _callback = callback,
        _controller = controller,
        super(key: key);

  final Function _callback;
  final TextEditingController _controller;

  @override
  State<NotesModal> createState() => _NotesModalState();
}

class _NotesModalState extends State<NotesModal> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text(
                ANOTACAO,
                style: UiText.headline2,
              ),
            ),
            Expanded(
              child: TextField(
                focusNode: focusNode,
                minLines: 20,
                maxLines: null,
                enabled: true,
                onChanged: (value) => widget._callback(value),
                controller: widget._controller,
                style: UiText.headline1,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(hintText: ANOTACAO_DIGITE),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        elevation: 0,
        onPressed: () => Navigator.of(context).pop(),
        child: SvgPicture.asset(UiSvg.create),
      ),
    );
  }
}
