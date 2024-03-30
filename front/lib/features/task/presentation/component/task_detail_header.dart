import 'package:flutter/material.dart';
import 'package:front/features/assiners/entity.dart/assiner.dart';
import 'package:front/features/task/presentation/component/task_detail_custom_text_button.dart';

class TaskDetailHeader extends StatelessWidget {
  const TaskDetailHeader(
      {super.key, required this.assiners, required this.dueDate});
  final List<Assiner> assiners;
  final DateTime dueDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(
            flex: 0,
            child: Row(
              children: assiners
                  .map((e) => const CircleAvatar(
                        backgroundColor: Colors.black12,
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(formatAssigners(assiners)),
                  Text(
                    '~${dueDate.year}.${dueDate.month}.${dueDate.day} ${dueDate.hour}:${dueDate.minute}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 0,
                      child: taskDetailCustomTextButton(
                          text: '수정', onPressed: () {})),
                  Expanded(
                      flex: 0,
                      child: taskDetailCustomTextButton(
                          text: '삭제', onPressed: () {})),
                ]),
          )
        ]),
      ],
    );
  }

  String formatAssigners(List<Assiner> assigners) {
    if (assigners.length > 3) {
      var names = assigners.take(3).map((e) => e.name).toList();
      var othersCount = assigners.length - 3;
      return '${names.join(', ')} 외 $othersCount명';
    } else {
      return assigners.map((e) => e.name).join(', ');
    }
  }
}
