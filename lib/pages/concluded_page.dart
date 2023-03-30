import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/classes/page_class.dart';
import 'package:tarefas_app/widget/header_widget.dart';

class ConcludedPage extends StatefulWidget {
  const ConcludedPage({Key? key}) : super(key: key);

  @override
  State<ConcludedPage> createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcludedPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderWidget(page: PageEnum.concluded),
          Text('planejamento'),
        ],
      ),
    );
  }
}
