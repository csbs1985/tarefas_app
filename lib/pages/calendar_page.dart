import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/widget/header_widget.dart';
import 'package:tarefas_app/enuns/page_enum.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderWidget(page: PageEnum.calendar),
          Text('planning'),
        ],
      ),
    );
  }
}
