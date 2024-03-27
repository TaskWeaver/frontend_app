// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:front/core/assiners/entity.dart/assiner.dart';

class TodoEntity {
  String title;
  String description;
  List<Assiner> assigners;
  DateTime dueDate;

  TodoEntity({
    required this.title,
    required this.description,
    required this.assigners,
    required this.dueDate,
  });
}
