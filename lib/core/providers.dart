import 'package:provider/provider.dart';
import 'package:tarefas_app/core/auth_service.dart';

final authService = AuthService();

final providers = [
  ChangeNotifierProvider<AuthService>.value(value: authService),
];
