import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/widget/header_widget.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

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
