import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/appbars/titulo_appbar.dart';

class ConcluidasPage extends StatefulWidget {
  const ConcluidasPage({Key? key}) : super(key: key);

  @override
  State<ConcluidasPage> createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcluidasPage> {
  @override
  void initState() {
    super.initState();
    currentCor.value = UiColor.calendario;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TituloAppbar(page: PageEnum.concluidas),
          Text(CONCLUIDAS),
        ],
      ),
    );
  }
}
