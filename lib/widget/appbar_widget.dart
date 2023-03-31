import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required Function? callback,
    required int menuItem,
    required PageController pageController,
  })  : _callback = callback,
        _menuItem = menuItem,
        _pageController = pageController;

  final Function? _callback;
  final int _menuItem;
  final PageController _pageController;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(32);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  static const _sizedGap = SizedBox(width: 4);
  static const _sizedMargin = SizedBox(width: 16);

  void selectMenuItem(PageEnum page) {
    widget._callback!(page);
    widget._pageController.animateToPage(
      page.value,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AppBar(
        actions: [
          _sizedMargin,
          _buildMenuButton(PageEnum.planejados),
          _sizedGap,
          _buildMenuButton(PageEnum.calendario),
          _sizedGap,
          _buildMenuButton(PageEnum.todas),
          _sizedGap,
          _buildMenuButton(PageEnum.concluidas),
          _sizedMargin,
        ],
      ),
    );
  }

  Widget _buildMenuButton(PageEnum menuItem) {
    final bool isSelected = widget._menuItem == menuItem.value;

    return Expanded(
      child: GestureDetector(
        child: AnimatedContainer(
          color: Colors.transparent,
          duration: const Duration(milliseconds: 400),
          padding: const EdgeInsets.fromLTRB(0, 18, 0, 4),
          child: SizedBox(
            height: 2,
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? UiColor.menuItemSelected : UiColor.menuItem,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        onTap: () => selectMenuItem(menuItem),
      ),
    );
  }
}
