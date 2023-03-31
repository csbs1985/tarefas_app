import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/widget/appbar_titulo_widget.dart';

class ConcluidasPage extends StatefulWidget {
  const ConcluidasPage({Key? key}) : super(key: key);

  @override
  State<ConcluidasPage> createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcluidasPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          AppBarTituloWidget(page: PageEnum.concluidas),
          Text(CONCLUIDAS),
        ],
      ),
    );
  }
}
