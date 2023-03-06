import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class AppBarComponent extends StatefulWidget with PreferredSizeWidget {
  const AppBarComponent({
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
  State<AppBarComponent> createState() => _AppBarComponentState();

  @override
  Size get preferredSize => const Size.fromHeight(32);
}

class _AppBarComponentState extends State<AppBarComponent> {
  static const _sizedBoxWidth = SizedBox(width: 8);

  selectMenuItem(int page) {
    widget._callback!(page);
    widget._pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AppBar(
        backgroundColor: UiColor.back,
        toolbarHeight: 4,
        actions: [
          _sizedBoxWidth,
          _buildMenuButton(0),
          _sizedBoxWidth,
          _buildMenuButton(1),
          _sizedBoxWidth,
          _buildMenuButton(2),
          _sizedBoxWidth,
          _buildMenuButton(3),
          _sizedBoxWidth
        ],
      ),
    );
  }

  Widget _buildMenuButton(int menuItem) {
    final bool isSelected = widget._menuItem == menuItem;

    return Expanded(
      child: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: 8,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? UiColor.menuItem : UiColor.menuItemSelected,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onTap: () => selectMenuItem(menuItem),
      ),
    );
  }
}
