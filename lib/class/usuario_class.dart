import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tarefas_app/hive/usuario_hive.dart';

ValueNotifier<Map<String, dynamic>?> currentUsuario =
    ValueNotifier<Map<String, dynamic>?>({});

class UsuarioModel {
  late String id;
  late String nome;
  late String email;
  late String? avatar;

  UsuarioModel(
    this.id,
    this.nome,
    this.email,
    this.avatar,
  );
}

class UsuarioClass {
  final UsuarioHive _usuarioHive = UsuarioHive();

  setUsuarioHiveToCurrent() {
    Map<dynamic, dynamic> usuarioHive = _usuarioHive.readUsuario();
    Map<String, dynamic> usuarioMap = mapDynamicToMapString(usuarioHive);
    setUsuario(usuarioMap);
  }

  userToMap(User usuario) {
    Map<String, dynamic> userMap = {
      'uid': usuario.uid,
      'displayName': usuario.displayName,
      'email': usuario.email,
      'photoUrl': usuario.photoURL,
    };

    return userMap;
  }

  setUsuario(Map<String, dynamic> usuario) {
    deleteUsuario();
    setUsuarioCurrent(usuario);
    setUsuarioHive(usuario);
  }

  deleteUsuario() {
    currentUsuario.value!.clear();
    _usuarioHive.deleteUsuario();
  }

  setUsuarioCurrent(Map<String, dynamic> usuario) {
    currentUsuario.value = {
      'id': usuario['uid'],
      'nome': usuario['displayName'],
      'email': usuario['email'],
      'avatar': usuario['photoUrl'],
    };
  }

  setUsuarioHive(Map<String, dynamic> usuario) {
    _usuarioHive.addUsuario(usuario);
  }

  mapDynamicToMapString(Map<dynamic, dynamic> usuario) {
    return usuario.map((chave, valor) => MapEntry(chave.toString(), valor));
  }
}
