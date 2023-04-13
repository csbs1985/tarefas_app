import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/class/page_class.dart';
import 'package:tarefas_app/theme/ui_size.dart';
import 'package:tarefas_app/widget/avatar_widget.dart';

class Appbar extends StatefulWidget with PreferredSizeWidget {
  const Appbar({
    super.key,
    required PageEnum page,
    required Function callback,
    bool back = false,
  })  : _page = page,
        _back = back,
        _callback = callback;

  final PageEnum _page;
  final bool _back;
  final Function _callback;

  @override
  State<Appbar> createState() => _HeaderWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(72);
}

class _HeaderWidgetState extends State<Appbar> {
  final PageClass _pageClass = PageClass();

  void backPage(PageEnum page) {
    if (widget._back) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 72,
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _pageClass.getText(widget._page),
              style: _pageClass.getStyle(widget._page),
            ),
            IconButton(
              onPressed: () => widget._callback(),
              icon: const AvatarWidget(size: UiSize.avatarPerfil),
            )
          ],
        ),
      ),
    );
  }
}
