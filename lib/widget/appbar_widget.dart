import 'package:flutter/material.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/theme/ui_color.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  const AppBarWidget({
    required Function? callback,
    required PageEnum menuItem,
    required PageController pageController,
  })  : _callback = callback,
        _menuItem = menuItem,
        _pageController = pageController;

  final Function? _callback;
  final PageEnum _menuItem;
  final PageController _pageController;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(40);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  static const _sizedBoxWidth = SizedBox(width: 4);

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
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: AppBar(
        toolbarHeight: 4,
        actions: [
          _sizedBoxWidth,
          _buildMenuButton(PageEnum.planning),
          _sizedBoxWidth,
          _buildMenuButton(PageEnum.calendar),
          _sizedBoxWidth,
          _buildMenuButton(PageEnum.all),
          _sizedBoxWidth,
          _buildMenuButton(PageEnum.concluded),
          _sizedBoxWidth
        ],
      ),
    );
  }

  Widget _buildMenuButton(PageEnum menuItem) {
    final bool isSelected = widget._menuItem == menuItem.value;

    return Expanded(
      child: GestureDetector(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: isSelected ? UiColor.menuItem : UiColor.menuItemUnselected,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onTap: () => selectMenuItem(menuItem),
      ),
    );
  }
}
