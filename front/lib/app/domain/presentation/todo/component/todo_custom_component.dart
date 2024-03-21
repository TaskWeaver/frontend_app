import 'package:flutter/material.dart';
import 'package:front/core/todo/entity/todo_entity.dart';

class TodoCustomComponent extends StatelessWidget {
  const TodoCustomComponent({super.key, required this.todo});
  final TodoEntity todo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      todo.description,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: todo.assigners
                          .map((e) => const CircleAvatar())
                          .toList(),
                    ),
                    Text(
                      '~${todo.dueDate.year}.${todo.dueDate.month}.${todo.dueDate.day}',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
