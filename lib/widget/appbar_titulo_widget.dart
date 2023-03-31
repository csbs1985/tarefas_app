import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/classes/page_class.dart';

class AppBarTituloWidget extends StatefulWidget {
  const AppBarTituloWidget({
    super.key,
    required PageEnum page,
    bool back = false,
  })  : _page = page,
        _back = back;

  final PageEnum _page;
  final bool _back;

  @override
  State<AppBarTituloWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<AppBarTituloWidget> {
  final PageClass _pageClass = PageClass();

  void backPage(PageEnum page) {
    if (widget._back) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
      child: Text(
        _pageClass.getText(widget._page),
        style: _pageClass.getStyle(widget._page),
      ),
    );
  }
}
