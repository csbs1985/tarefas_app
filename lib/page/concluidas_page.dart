import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/class/page_class.dart';
import 'package:tarefas_app/class/tarefa_class.dart';
import 'package:tarefas_app/class/usuario_class.dart';
import 'package:tarefas_app/item/concluidas_item.dart';
import 'package:tarefas_app/skeleton/item_tarefa_sekeleton.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/appbar/appbar.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/perfil_drawer.dart';

class ConcluidasPage extends StatefulWidget {
  const ConcluidasPage({Key? key}) : super(key: key);

  @override
  State<ConcluidasPage> createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcluidasPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TarefaClass _tarefaClass = TarefaClass();

  List<Map<String, dynamic>> _tarefa = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    currentCor.value = UiColor.concluidas;
    initListView();
  }

  initListView() {
    _tarefa = _tarefaClass.formatConcluidas();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: Appbar(
        page: PageEnum.concluidas,
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
                        return ConcluidasItem(tarefa: _tarefa[index]);
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
        onPressed: () => _tarefaClass.openModal(context),
        child: SvgPicture.asset(UiSvg.criar),
      ),
    );
  }
}
