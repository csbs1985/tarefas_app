import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/page_class.dart';
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

  setCurrentPage(int page) {
    setState(() => currentPageInt.value = page);
  }

  void confirmTask() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHiddenWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderWidget(
              page: PageEnum.task,
              back: true,
            ),
            Text('task'),
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
