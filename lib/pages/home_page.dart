import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/modals/task_modal.dart';
import 'package:tarefas_app/pages/all_page.dart';
import 'package:tarefas_app/pages/calendar_page.dart';
import 'package:tarefas_app/pages/concluded_page.dart';
import 'package:tarefas_app/pages/planning_page.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageClass _pageClass = PageClass();
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageInt.value);
  }

  setCurrentPage(int page) {
    setState(() => currentPageInt.value = page);
  }

  _openTaskModal() {
    showCupertinoModalBottomSheet(
      expand: true,
      context: context,
      barrierColor: UiColor.element,
      duration: const Duration(milliseconds: 300),
      builder: (context) => const TaskModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _color = _pageClass.getColorInt(currentPageInt.value);

    return Scaffold(
      appBar: AppBarWidget(
        menuItem: currentPageInt.value,
        callback: (value) => setCurrentPage(value.value),
        pageController: pageController,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: setCurrentPage,
        children: const [
          PlanningPage(),
          CalendarPage(),
          AllPage(),
          ConcludedPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _color,
        elevation: 0,
        onPressed: () => _openTaskModal(),
        child: SvgPicture.asset(
          UiSvg.create,
        ),
      ),
    );
  }
}
