import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/core/constants.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:tarefas_app/appbars/titulo_appbar.dart';

class TodasPage extends StatefulWidget {
  const TodasPage({Key? key}) : super(key: key);

  @override
  State<TodasPage> createState() => _AllPageState();
}

class _AllPageState extends State<TodasPage> {
  @override
  void initState() {
    super.initState();
    currentCor.value = UiColor.todas;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          TituloAppbar(page: PageEnum.todas),
          Text(TODAS),
        ],
      ),
    );
  }
}
