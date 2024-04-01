import 'package:flutter/material.dart';
import 'package:front/features/task/comment/comment_entity.dart';
import 'package:front/features/task/presentation/component/task_detail_custom_text_button.dart';

class TaskDetailCommentComponent extends StatelessWidget {
  const TaskDetailCommentComponent(
      {super.key, required this.comment, required this.reply});
  final CommentEntity comment;
  final List<CommentEntity> reply;
  @override
  Widget build(BuildContext context) {
    var timeTextStyle = const TextStyle(color: Colors.black87, fontSize: 10);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              flex: 0,
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                radius: 10,
              ),
            ),
            Expanded(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(comment.authorName),
              ),
            ),
            Expanded(
                flex: 2,
                child:
                    taskDetailCustomTextButton(text: '수정', onPressed: () {})),
            Expanded(
                flex: 2,
                child:
                    taskDetailCustomTextButton(text: '삭제', onPressed: () {})),
          ],
        ),
        Text(comment.content),
        const SizedBox(height: 4),
        Text(
            style: timeTextStyle,
            '${comment.createdAt.year}.${comment.createdAt.month.toString().padLeft(2, '0')}.${comment.createdAt.day.toString().padLeft(2, '0')}. ${comment.createdAt.hour.toString().padLeft(2, '0')}:${comment.createdAt.minute.toString().padLeft(2, '0')}'),
        const SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
          ),
          onPressed: () {},
          child: const Text(
            '답글',
            style: TextStyle(color: Colors.black),
          ),
        ),
        for (var reply in reply)
          Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.black12,
                          radius: 10,
                        ),
                      ),
                      Expanded(
                        flex: 14,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(reply.authorName),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: taskDetailCustomTextButton(
                              text: '수정', onPressed: () {})),
                      Expanded(
                          flex: 2,
                          child: taskDetailCustomTextButton(
                              text: '삭제', onPressed: () {})),
                    ],
                  ),
                  Text(reply.content),
                  const SizedBox(height: 4),
                  Text(
                      style: timeTextStyle,
                      '${reply.createdAt.year}.${reply.createdAt.month.toString().padLeft(2, '0')}.${reply.createdAt.day.toString().padLeft(2, '0')}. ${reply.createdAt.hour.toString().padLeft(2, '0')}:${reply.createdAt.minute.toString().padLeft(2, '0')}'),
                ],
              )),
        const SizedBox(height: 4),
        const Divider(),
      ],
    );
  }
}
