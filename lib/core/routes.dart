import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/pages/home_page.dart';

final routes = GoRouter(
  initialLocation: RouteEnum.HOME.value,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: RouteEnum.HOME.value,
      builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const HomePage(),
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
  PLANNING('/planning'),
  HOME('/home');

  final String value;
  const RouteEnum(this.value);
}
