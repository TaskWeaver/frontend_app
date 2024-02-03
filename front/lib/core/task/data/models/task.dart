import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/core/task/domain/entities/task.dart';

class TaskModel {
  TaskModel(
      {required this.title,
      required this.content,
      this.dueDate,
      required this.participants,
      this.color,
      this.file,
      required this.iconPath,
      this.numOfTotalTask,
      this.numOfComplateTask});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        title: json['title'],
        content: json['content'],
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


  final String title;
  final String content;
  final DateTime? dueDate;
  final List<String> participants;
  final Color? color;
  final File? file;
  final String iconPath;
  final int? numOfComplateTask;
  final int? numOfTotalTask;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'dueDate': dueDate?.toIso8601String(),
      'participants': participants,
      'color': color?.value,
      'file': file?.path,
      'iconPath': iconPath,
    };
  }

  TaskEntity toEntity() {
    return TaskEntity(
        title: title,
        content: content,
        participants: participants,
        iconPath: iconPath);
  }
}
