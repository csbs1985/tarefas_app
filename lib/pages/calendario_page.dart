import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/widget/appbar_titulo_widget.dart';

class CalendarioPage extends StatefulWidget {
  const CalendarioPage({Key? key}) : super(key: key);

  @override
  State<CalendarioPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarioPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          AppBarTituloWidget(page: PageEnum.calendario),
          Text(CALENDARIO),
        ],
      ),
    );
  }
}
