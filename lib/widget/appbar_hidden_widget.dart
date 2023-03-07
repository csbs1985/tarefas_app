import 'package:flutter/material.dart';

class AppBarHiddenWidget extends StatefulWidget with PreferredSizeWidget {
  const AppBarHiddenWidget({super.key});

  @override
  State<AppBarHiddenWidget> createState() => _AppBarHiddenWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

class _AppBarHiddenWidgetState extends State<AppBarHiddenWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
