import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/pages/calendario_page.dart';
import 'package:tarefas_app/pages/concluidas_page.dart';
import 'package:tarefas_app/pages/entrar_page.dart';
import 'package:tarefas_app/pages/perfil_page.dart';
import 'package:tarefas_app/pages/planejamento_page.dart';
import 'package:tarefas_app/modals/tarefa_modal.dart';
import 'package:tarefas_app/pages/todas_page.dart';
import 'package:tarefas_app/theme/ui_text.dart';

final AuthService _authService = AuthService();

final GoRouter routes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RouteEnum.PLANEJADOS.value,
  refreshListenable: _authService,
  redirect: (context, state) {
    final isAuthenticated = _authService.isAuthenticated;
    final isLoginRoute = state.subloc == RouteEnum.ENTRAR.value;

    if (!isAuthenticated) return isLoginRoute ? null : RouteEnum.ENTRAR.value;
    if (isLoginRoute) return RouteEnum.PLANEJADOS.value;
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const PlanejamentoPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.CALENDARIO.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const CalendarioPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.CONCLUIDAS.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ConcluidasPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.ENTRAR.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const EntrarPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.PERFIL.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const PerfilPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.PLANEJADOS.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const PlanejamentoPage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.TAREFA.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const TarefaModal(),
      ),
    ),
    GoRoute(
      path: RouteEnum.TODAS.value,
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const TodasPage(),
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

class RouteModel {
  final String text;
  final String value;
  final TextStyle style;

  RouteModel({
    required this.text,
    required this.value,
    required this.style,
  });
}

final List<RouteModel> ListaMenu = [
  RouteModel(
    text: TAREFA_CRIA,
    value: RouteEnum.TAREFA.value,
    style: UiText.tarefa,
  ),
  RouteModel(
    text: PLANEJADOS,
    value: RouteEnum.PLANEJADOS.value,
    style: UiText.planejados,
  ),
  RouteModel(
    text: CALENDARIO,
    value: RouteEnum.CALENDARIO.value,
    style: UiText.calendario,
  ),
  RouteModel(
    text: TODAS,
    value: RouteEnum.TODAS.value,
    style: UiText.todas,
  ),
  RouteModel(
    text: CONCLUIDAS,
    value: RouteEnum.CONCLUIDAS.value,
    style: UiText.concluidas,
  ),
];

enum RouteEnum {
  CALENDARIO('/calendario'),
  CONCLUIDAS('/concluidas'),
  ENTRAR('/entrar'),
  PERFIL('/perfil'),
  PLANEJADOS('/planejados'),
  TODAS('/todas'),
  TAREFA('/tarefa');

  final String value;
  const RouteEnum(this.value);
}
