import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

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
  setUsuario(User? usuario) {
    currentUsuario.value = {
      'id': usuario!.uid,
      'nome': usuario.displayName,
      'email': usuario.email,
      'avatar': usuario.photoURL,
    };
  }
}
