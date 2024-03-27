// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TaskEntity {
  String title;
  String content;
  DateTime startDate;
  DateTime endDate;
  List<int> members;
  Color color;
  int? parentTaskId;
  TaskEntity({
    required this.title,
    required this.content,
    required this.startDate,
    required this.endDate,
    required this.members,
    required this.color,
    this.parentTaskId,
  });
}
