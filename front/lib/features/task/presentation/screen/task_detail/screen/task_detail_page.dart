import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/assiners/entity.dart/assiner.dart';
import 'package:front/features/task/presentation/component/task_detail_comment_input_builder.dart';
import 'package:front/features/task/presentation/component/task_detail_comments_builder.dart';
import 'package:front/features/task/presentation/component/task_detail_content_builder.dart';
import 'package:front/features/task/presentation/component/task_detail_header.dart';
import 'package:front/features/task/presentation/component/task_detail_status_component.dart';
import 'package:front/features/task/presentation/temp_provider.dart';

class TaskDetailScreen extends ConsumerWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ref.watch(selectedTaskProvider).when(
                  data: (selectedTask) {
                    return Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TaskDetailStatusComponent(
                              taskStatus: 'pending'),
                          TaskDetailHeader(assiners: [
                            Assiner(name: '임꺽정'),
                          ], dueDate: selectedTask.endDate),
                          const Divider(
                            color: Colors.black,
                          ),
                          TaskDetailContentBuilder(taskEntity: selectedTask),
                          const Divider(
                            color: Colors.black,
                          ),
                          const TaskDetailCommentsBuilder(),
                          const TaskDetailCommentInput(),
                        ]);
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stack) => Text('Error: $error'),
                )),
      ),
    );
  }
}
