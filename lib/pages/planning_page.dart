import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/widget/header_widget.dart';
import 'package:tarefas_app/enuns/page_enum.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderWidget(page: PageEnum.planning),
          Text('planning'),
        ],
      ),
    );
  }
}
