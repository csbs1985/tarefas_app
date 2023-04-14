import 'package:flutter/material.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/theme/ui_image.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({
    super.key,
    double? size = 24,
  }) : _size = size;

  final double? _size;

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentUsuario,
      builder: (BuildContext context, Map<String, dynamic>? usuario, _) {
        return usuario!['avatar'] != null
            ? CircleAvatar(
                radius: widget._size,
                backgroundImage: NetworkImage(usuario['avatar']))
            : CircleAvatar(
                radius: widget._size,
                backgroundImage: const AssetImage(UiImage.avatar));
      },
    );
  }
}
