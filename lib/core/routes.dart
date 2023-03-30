import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/pages/tarefa_page.dart';
import 'package:tarefas_app/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: RouteEnum.HOME.value,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteEnum.HOME.value,
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.TAREFA.value,
      builder: (context, state) => const TarefaPage(),
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
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1, 0.0),
          end: Offset.zero,
        ),
      ),
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
  HOME('/home');

  final String value;
  const RouteEnum(this.value);
}
