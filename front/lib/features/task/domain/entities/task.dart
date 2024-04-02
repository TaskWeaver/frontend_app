import 'dart:io';
import 'package:flutter/material.dart';

class TaskEntity {
  TaskEntity(
      {required this.title,
      required this.content,
      this.dueDate,
      required this.participants,
      this.color,
      this.file,
      required this.iconPath,
      this.numOfTotalTask,
      this.numOfComplateTask});

  final String title;
  final String content;
  final DateTime? dueDate;
  final List<String> participants;
  final Color? color;
  final File? file;
  final String iconPath;
  final int? numOfComplateTask;
  final int? numOfTotalTask;
}
