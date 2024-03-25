import 'package:flutter/material.dart';

class TaskDetailCommentInput extends StatelessWidget {
  const TaskDetailCommentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '댓글을 입력하세요',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // Add your comment submission logic here
            },
            child: const Text('입력'),
          ),
        ],
      ),
    );
  }
}
