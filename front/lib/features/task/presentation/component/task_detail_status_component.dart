import 'package:flutter/material.dart';

class TaskStatus {
  static String pending = 'pending';
  static String completed = 'completed';
  static String inProgress = 'inProgress';
}

class TaskDetailStatusComponent extends StatelessWidget {
  const TaskDetailStatusComponent({super.key, required this.taskStatus});
  final String taskStatus;
  @override
  Widget build(BuildContext context) {
    if (taskStatus == TaskStatus.pending) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Text('Pending'));
    } else if (taskStatus == TaskStatus.completed) {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Text('Completed'));
    } else {
      return Container(
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: const Text('In Progress'));
    }
  }
}
