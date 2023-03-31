import 'package:flutter/material.dart';
import 'package:tarefas_app/core/routes.dart';

class AuthService extends ChangeNotifier {
  bool isAuthenticated = false;

  login() {
    isAuthenticated = true;
    notifyListeners();
  }

  logout() {
    isAuthenticated = false;
    notifyListeners();
  }

  redirect(state) {
    final isLoginRoute = state.subloc == RouteEnum.ENTRAR.value;

    if (!isAuthenticated) return isLoginRoute ? null : RouteEnum.ENTRAR.value;
    if (isLoginRoute) RouteEnum.INICIO.value;
    return null;
  }
}
