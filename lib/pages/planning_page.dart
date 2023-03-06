import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/components/header_component.dart';
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
          HeaderComponent(page: PageEnum.planning),
          Text('planning'),
        ],
      ),
    );
  }
}
