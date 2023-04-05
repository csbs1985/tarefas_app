import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/appbars/voltar_appbar.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/classes/tarefa_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/appbars/titulo_appbar.dart';
import 'package:tarefas_app/theme/ui_svg.dart';

class ConcluidasPage extends StatefulWidget {
  const ConcluidasPage({Key? key}) : super(key: key);

  @override
  State<ConcluidasPage> createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcluidasPage> {
  final TarefaClass _tarefaClass = TarefaClass();

  @override
  void initState() {
    super.initState();
    currentCor.value = UiColor.concluidas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VoltarAppbar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              TituloAppbar(page: PageEnum.concluidas),
              Text(CONCLUIDAS),
            ],
          ),
        ),
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
