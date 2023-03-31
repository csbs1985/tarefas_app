import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/widget/appbar_titulo_widget.dart';

class TodasPage extends StatefulWidget {
  const TodasPage({Key? key}) : super(key: key);

  @override
  State<TodasPage> createState() => _AllPageState();
}

class _AllPageState extends State<TodasPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          AppBarTituloWidget(page: PageEnum.todas),
          Text(TODAS),
        ],
      ),
    );
  }
}
