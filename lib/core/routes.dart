import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/pages/tarefa_page.dart';
import 'package:tarefas_app/pages/home_page.dart';

final AuthService _authService = AuthService();

final GoRouter routes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RouteEnum.HOME.value,
  // refreshListenable: _authService,
  // redirect: (context, state) => _authService.redirect(state),
  routes: [
    GoRoute(
      path: RouteEnum.HOME.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomePage(),
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
  ALL('/all'),
  CALENDAR('/calendar'),
  CONCLUDED('/concluded'),
  PLANEJAMENTO('/planejamento'),
  TAREFA('/tarefa'),
  LOGIN('/login'),
  HOME('/home');

  final String value;
  const RouteEnum(this.value);
}
