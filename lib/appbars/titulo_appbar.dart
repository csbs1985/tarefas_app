import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:tarefas_app/theme/ui_size.dart';
import 'package:tarefas_app/widget/avatar_widget.dart';

class TituloAppbar extends StatefulWidget {
  const TituloAppbar({
    super.key,
    required PageEnum page,
    bool back = false,
  })  : _page = page,
        _back = back;

  final PageEnum _page;
  final bool _back;

  @override
  State<TituloAppbar> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<TituloAppbar> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _pageClass.getText(widget._page),
            style: _pageClass.getStyle(widget._page),
          ),
          if (widget._page == PageEnum.planejados)
            IconButton(
              onPressed: () => context.push(RouteEnum.PERFIL.value),
              icon: const AvatarWidget(size: UiSize.avatarPerfil),
            )
        ],
      ),
    );
  }
}
