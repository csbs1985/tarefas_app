import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/appbar/appbar.dart';
import 'package:tarefas_app/class/page_class.dart';
import 'package:tarefas_app/class/tarefa_class.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/core/auth_service.dart';
import 'package:tarefas_app/hive/usuario_hive.dart';
import 'package:tarefas_app/item/planejados_item.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/perfil_drawer.dart';

class PlanejadosPage extends StatefulWidget {
  const PlanejadosPage({Key? key}) : super(key: key);

  @override
  State<PlanejadosPage> createState() => _PlanejamentoPageState();
}

class _PlanejamentoPageState extends State<PlanejadosPage> {
  final AuthService _authService = AuthService();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TarefaClass _tarefaClass = TarefaClass();
  final UsuarioClass _usuarioClass = UsuarioClass();
  final UsuarioHive _usuarioHive = UsuarioHive();

  List<Map<String, dynamic>> _tarefa = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    localNotifications();
    signInWithGoogle(context);
    currentCor.value = UiColor.planejados;
    initListView();
  }

  initListView() {
    _tarefa = _tarefaClass.listToMap();
    setState(() => isLoading = false);
  }

  localNotifications() async {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed)
        AwesomeNotifications().requestPermissionToSendNotifications();
    });
  }

  signInWithGoogle(BuildContext context) async {
    if (_usuarioHive.checkUsuario()) {
      Map<String, dynamic> usuarioHive =
          _usuarioClass.mapDynamicToMapString(_usuarioHive.readUsuario());
      _usuarioClass.setUsuario(usuarioHive);
    } else
      await _authService.signIn(context);
  }

  void setCurrentPage(int page) {
    setState(() => currentPageInt.value = page);
  }

  Future<void> _openModal(BuildContext context) async {
    _tarefaClass.openModal(context);
    // await Provider.of<LocalNotificationClass>(context, listen: false)
    //     .createNewNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: Appbar(
        page: PageEnum.planejados,
        callback: () => scaffoldKey.currentState!.openDrawer(),
      ),
      drawer: const PerfilDrawer(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: isLoading
                ? const ItemTarefaSkeleton()
                : ListView.separated(
                    itemCount: _tarefa.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      if (currentUsuario.value != null && _tarefa.isNotEmpty)
                        return PlanejadosItem(tarefa: _tarefa[index]);
                      return null;
                    },
                  ),
          ),
          const SizedBox(height: 90),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentCor.value,
        elevation: 0,
        onPressed: () => _openModal(context),
        child: SvgPicture.asset(UiSvg.criar),
      ),
    );
  }
}
