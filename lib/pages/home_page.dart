import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:tarefas_app/pages/all_page.dart';
import 'package:tarefas_app/pages/calendar_page.dart';
import 'package:tarefas_app/pages/concluded_page.dart';
import 'package:tarefas_app/pages/planning_page.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageClass _pageClass = PageClass();

  int currentPage = PageEnum.planning.value;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage);
  }

  setCurrentPage(int page) {
    setState(() => currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    var _color = _pageClass.getColorInt(currentPage);

    return Scaffold(
      appBar: AppBarWidget(
        menuItem: currentPage,
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
        onPressed: () => GoRouter.of(context).push(RouteEnum.TASK.value),
        child: SvgPicture.asset(
          UiSvg.create,
        ),
      ),
    );
  }
}
