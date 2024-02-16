import 'package:equatable/equatable.dart';

class ProjectCreateModel extends Equatable {
  const ProjectCreateModel({
    required this.team_id,
    required this.name,
    required this.description,
  });
  
  final String team_id;
  final String name;
  final String description;

  @override
  List<Object?> get props => [ team_id, name, description ];
}
