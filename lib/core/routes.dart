import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/pages/entrar_page.dart';
import 'package:tarefas_app/pages/inicio_page.dart';
import 'package:tarefas_app/pages/tarefa_page.dart';

final AuthService _authService = AuthService();

final GoRouter routes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RouteEnum.INICIO.value,
  refreshListenable: _authService,
  redirect: (context, state) {
    final isAuthenticated = _authService.isAuthenticated;
    final isLoginRoute = state.subloc == RouteEnum.ENTRAR.value;

    if (!isAuthenticated) return isLoginRoute ? null : RouteEnum.ENTRAR.value;
    if (isLoginRoute) return RouteEnum.INICIO.value;
    return null;
  },
  routes: [
    GoRoute(
      path: RouteEnum.ENTRAR.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const EntrarPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.INICIO.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const InicioPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.TAREFA.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const TarefaPage(),
      ),
    ),
  ],
);

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: child,
    ),
  );
}

enum RouteEnum {
  ENTRAR('/entrar'),
  INICIO('/inicio'),
  TAREFA('/tarefa');

  final String value;
  const RouteEnum(this.value);
}
