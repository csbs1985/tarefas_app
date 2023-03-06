import 'package:flutter/cupertino.dart';
import 'package:tarefas_app/components/header_component.dart';
import 'package:tarefas_app/enuns/page_enum.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeaderComponent(page: PageEnum.all),
          Text('planning'),
        ],
      ),
    );
  }
}
