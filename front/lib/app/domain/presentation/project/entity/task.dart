import 'dart:io';

import 'package:flutter/material.dart';

class Task {
  Task(
      {required this.taskTitle,
      required this.taskContent,
      this.dueDate,
      required this.participants,
      this.color,
      this.file,
      required this.iconPath,
      this.numOfTotalTask,
      this.numOfComplateTask});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        taskTitle: json['taskTitle'],
        taskContent: json['taskContent'],
        dueDate:
            json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
        participants: json['participants'] != null
            ? List<String>.from(json['participants'])
            : [],
        color: Color(json['color']),
        file: json['file'] != null ? File(json['file']) : null,
        iconPath: json['iconPath'],
        numOfTotalTask: json['numOfTotalTask'],
        numOfComplateTask: json['numOfComplateTask']);
  }
  final String taskTitle;
  final String taskContent;
  final DateTime? dueDate;
  final List<String> participants;
  final Color? color;
  final File? file;
  final String iconPath;
  final int? numOfComplateTask;
  final int? numOfTotalTask;
  Map<String, dynamic> toJson() {
    return {
      'taskTitle': taskTitle,
      'taskContent': taskContent,
      'dueDate': dueDate?.toIso8601String(),
      'participants': participants,
      'color': color?.value,
      'file': file?.path,
      'iconPath': iconPath,
    };
  }
}
