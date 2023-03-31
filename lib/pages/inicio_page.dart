import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/routes.dart';
import 'package:tarefas_app/pages/todas_page.dart';
import 'package:tarefas_app/pages/calendario_page.dart';
import 'package:tarefas_app/pages/concluidas_page.dart';
import 'package:tarefas_app/pages/planejamento_page.dart';
import 'package:tarefas_app/theme/ui_svg.dart';
import 'package:tarefas_app/widget/appbar_widget.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _HomePageState();
}

class _HomePageState extends State<InicioPage> {
  final PageClass _pageClass = PageClass();
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPageInt.value);
  }

  void setCurrentPage(int page) {
    setState(() => currentPageInt.value = page);
  }

  @override
  Widget build(BuildContext context) {
    var color = _pageClass.getColorInt(currentPageInt.value);

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
          PlanejamentoPage(),
          CalendarioPage(),
          TodasPage(),
          ConcluidasPage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        elevation: 0,
        onPressed: () => context.push(RouteEnum.TAREFA.value),
        child: SvgPicture.asset(UiSvg.criar),
      ),
    );
  }
}
