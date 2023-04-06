import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

class VoltarAppbar extends StatefulWidget with PreferredSizeWidget {
  const VoltarAppbar({super.key});

  @override
  State<VoltarAppbar> createState() => _VoltarAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _VoltarAppbarState extends State<VoltarAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          icon: SvgPicture.asset(UiSvg.voltar, color: currentCor.value),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
