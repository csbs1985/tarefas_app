import 'package:flutter/material.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/widget/header_widget.dart';
import 'package:tarefas_app/widget/tarefa_item_widget.dart';

class PlanejamentoPage extends StatefulWidget {
  const PlanejamentoPage({Key? key}) : super(key: key);

  @override
  State<PlanejamentoPage> createState() => _PlanejamentoPageState();
}

class _PlanejamentoPageState extends State<PlanejamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          const HeaderWidget(page: PageEnum.planejamento),
          Flexible(
            child: ListView.separated(
              itemCount: 20,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return const TarefaItemWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
