import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/pages/all_page.dart';
import 'package:tarefas_app/pages/calendar_page.dart';
import 'package:tarefas_app/pages/concluded_page.dart';
import 'package:tarefas_app/pages/planning_page.dart';
import 'package:tarefas_app/widget/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageClass _pageClass = PageClass();

  PageEnum currentPage = PageEnum.planning;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPage.value);
  }

  getCurrentPage(int page) {
    // var test = PageEnum.values(page);
    // setCurrentPage(page);
  }

  setCurrentPage(PageEnum page) {
    setState(() => currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        menuItem: currentPage,
        callback: (value) => setCurrentPage(value.value),
        pageController: pageController,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: getCurrentPage,
        children: const [
          PlanningPage(),
          CalendarPage(),
          AllPage(),
          ConcludedPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _pageClass.getColor(currentPage),
        onPressed: () {
          print(
            'Botão flutuante pressionado!',
          ); //TODO: criar rota pagina tarefa
        },
        child: SvgPicture.asset(UiSvg.create),
      ),
    );
  }
}
