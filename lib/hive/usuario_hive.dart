import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UsuarioHive {
  final _usuarioBox = Hive.box('usuario');

  addUsuario(Map<String, dynamic> usuario) {
    _usuarioBox.add(usuario);
  }

  deleteUsuario() {
    _usuarioBox.delete(0);
  }

  readUsuario() {
    return _usuarioBox.get(1);
  }

  checkUsuario() {
    return _usuarioBox.isNotEmpty;
  }
}
