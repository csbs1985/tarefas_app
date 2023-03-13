import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/input/amount_input.dart';
import 'package:tarefas_app/input/text_input.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/theme/ui_text.dart';

class TaskModal extends StatefulWidget {
  const TaskModal({super.key});

  @override
  State<TaskModal> createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  final _taskController = TextEditingController();
  final _dayController = TextEditingController();
  final _amountController = TextEditingController();

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
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 64,
        title: Text(
          'Tarefa',
          style: UiText.titleTask,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  label: 'Valor R\$',
                  callback: (value) => print(value),
                ),
              ],
            ),
          ),
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
