import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/input/amount_input.dart';
import 'package:tarefas_app/input/text_input.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/appbar_hidden_widget.dart';
import 'package:tarefas_app/widget/header_widget.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  PageController pageController = PageController();

  final _formKey = GlobalKey<FormState>();

  final _taskController = TextEditingController();
  final _dayController = TextEditingController();
  final _amountController = TextEditingController();

  setCurrentPage(int page) {
    setState(() => currentPageInt.value = page);
  }

  void confirmTask() {}

  @override
  void dispose() {
    _taskController.dispose();
    _dayController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHiddenWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              page: PageEnum.task,
              back: true,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  children: [
                    TextInput(
                      controller: _taskController,
                      label: 'Tarefa',
                      callback: (value) => print(value),
                    ),
                    TextInput(
                      controller: _dayController,
                      label: 'Dia',
                      keyboard: TextInputType.number,
                      callback: (value) => print(value),
                    ),
                    AmountInput(
                      controller: _amountController,
                      label: 'Valor',
                      callback: (value) => print(value),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColor.task,
        onPressed: () => confirmTask,
        child: SvgPicture.asset(UiSvg.confirm),
      ),
    );
  }
}
