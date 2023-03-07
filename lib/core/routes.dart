import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/pages/task_page.dart';

final routes = GoRouter(
  initialLocation: RouteEnum.PLANNING.value,
  // refreshListenable: _authService,
  debugLogDiagnostics: true,
  // redirect: (BuildContext context, GoRouterState state) async {
  //   if (_authService.isLoading)
  //     return PageEnum.LOADING.value;
  //   else if (_authService.user == null)
  //     return PageEnum.LOGIN.value;
  //   else {
  //     await _userService.initUser(context);
  //     return PageEnum.HOME.value;
  //   }
  // },
  routes: [
    GoRoute(
      path: RouteEnum.TASK.value,
      builder: (context, state) => const TaskPage(),
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const TaskPage(),
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
          begin: const Offset(1, 0),
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
  TASK('/task');

  final String value;
  const RouteEnum(this.value);
}
