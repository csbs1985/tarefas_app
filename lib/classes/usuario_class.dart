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
    currentUsuario.value = {
      'id': usuario['id'],
      'nome': usuario['nome'],
      'email': usuario['email'],
      'avatar': usuario['avatar'],
    };
  }

  setUsuarioHive() {
    _usuarioHive.addUsuario(currentUsuario.value!);
  }

  mapDynamicToMapString(Map<dynamic, dynamic> usuario) {
    Map<String, dynamic> novoMapa = usuario.map((chave, valor) {
      return MapEntry(chave.toString(), valor);
    });

    return novoMapa;
  }
}
