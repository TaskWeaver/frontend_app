import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable{
  const ProjectEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.assignee,
    required this.startDate,
  });

  final String id;
  final String title;
  final String content;
  final String assignee;
  final DateTime startDate;
  
  @override
  List<Object?> get props => [title, content, assignee, startDate];
}
