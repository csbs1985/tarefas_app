import 'package:flutter/material.dart';
import 'package:tarefas_app/components/appbar_component.dart';
import 'package:tarefas_app/pages/all_page.dart';
import 'package:tarefas_app/pages/calendar_page.dart';
import 'package:tarefas_app/pages/concluded_page.dart';
import 'package:tarefas_app/pages/planning_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

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
    return Scaffold(
      appBar: AppBarComponent(
        menuItem: currentPage,
        callback: (value) => setCurrentPage(value),
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
    );
  }
}
