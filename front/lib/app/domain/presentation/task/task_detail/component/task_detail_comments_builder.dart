import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/task/task_detail/component/task_detail_comment_component.dart';
import 'package:front/app/domain/presentation/task/task_detail/temp_provider.dart';
import 'package:front/core/task/comment/comment_entity.dart';

class TaskDetailCommentsBuilder extends ConsumerWidget {
  const TaskDetailCommentsBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var comments = ref.watch(commentProvider);

    var groupedComments = <int?, List<CommentEntity>>{};
    for (var comment in comments) {
      var parentId = comment.parentId ?? comment.id;
      groupedComments.putIfAbsent(parentId, () => []).add(comment);
    }

    var commentWidgets = <Widget>[];
    groupedComments.forEach((parentId, group) {
      commentWidgets.add(TaskDetailCommentComponent(
          comment: group[0], reply: group.skip(1).toList()));
    });

    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('댓글'),
        const SizedBox(height: 10),
        ...commentWidgets,
      ]),
    );
  }
}
