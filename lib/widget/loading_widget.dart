import 'package:flutter/material.dart';
import 'package:widget_loading/widget_loading.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularWidgetLoading(
      padding: EdgeInsets.zero,
      loading: true,
      child: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: const Center(child: Text('Loaded!')),
      ),
    );
  }
}
