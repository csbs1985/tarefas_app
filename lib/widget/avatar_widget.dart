import 'package:flutter/material.dart';
import 'package:tarefas_app/classes/usuario_class.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    super.key,
    double? size = 32,
  }) : _size = size;

  final double? _size;

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return currentUsuario.value!['avatar'] != null
        ? CircleAvatar(
            radius: widget._size,
            backgroundImage: NetworkImage(currentUsuario.value!['avatar']))
        : CircleAvatar(
            radius: widget._size,
            backgroundImage: const AssetImage('assets/images/avatar.gif'));
  }
}