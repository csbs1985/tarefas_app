import 'package:flutter/material.dart';
import 'package:tarefas_app/theme/ui_border.dart';
import 'package:tarefas_app/theme/ui_color.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class ItemTarefaSkeleton extends StatefulWidget {
  const ItemTarefaSkeleton({super.key});

  @override
  State<ItemTarefaSkeleton> createState() => _ItemTarefaSkeletonState();
}

class _ItemTarefaSkeletonState extends State<ItemTarefaSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSkeletonWidget(),
        const SizedBox(height: 8),
        _buildSkeletonWidget(),
        const SizedBox(height: 8),
        _buildSkeletonWidget(),
      ],
    );
  }

  Widget _buildSkeletonWidget() {
    return Skeleton(
      width: MediaQuery.of(context).size.width,
      height: 54,
      textColor: UiColor.skeleton,
      borderRadius: BorderRadius.circular(UiBorder.rounded),
    );
  }
}
