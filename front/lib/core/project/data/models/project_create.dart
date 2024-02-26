import 'package:equatable/equatable.dart';

class ProjectRequestModel extends Equatable {
  const ProjectRequestModel({
    required this.managerId,
    required this.name,
    required this.description,
  });

  final int managerId;
  final String name;
  final String description;

  @override
  List<Object?> get props => [managerId, name, description];
}
