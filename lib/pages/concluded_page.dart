import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/components/header_component.dart';
import 'package:tarefas_app/enuns/page_enum.dart';

class ConcludedPage extends StatefulWidget {
  const ConcludedPage({super.key});

  @override
  State<ConcludedPage> createState() => _ConcludedPageState();
}

class _ConcludedPageState extends State<ConcludedPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderComponent(page: PageEnum.concluded),
          Text('planning'),
        ],
      ),
    );
  }
}
