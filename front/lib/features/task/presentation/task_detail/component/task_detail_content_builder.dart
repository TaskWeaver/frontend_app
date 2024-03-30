import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/task/domain/entities/task_entity.dart';

class TaskDetailContentBuilder extends ConsumerWidget {
  const TaskDetailContentBuilder({super.key, required this.taskEntity});

  final TaskEntity taskEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var titleTextStyle =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 200),
      child: Column(
        children: [
          Text(
            taskEntity.title,
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            taskEntity.content,
          ),
        ],
      ),
    );
  }
}
