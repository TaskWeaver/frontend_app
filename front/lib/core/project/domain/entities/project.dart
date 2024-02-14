// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project({
    required this.pro_id,
    required this.team_id,
    required this.name,
    required this.discription,
    required this.created_at,
    required this.finished_at,
    required this.deleted_at,
  });

  final String pro_id;
  final String team_id;
  final String name;
  final String discription;
  final DateTime created_at;
  final DateTime? finished_at;
  final DateTime? deleted_at;

  @override
  List<Object?> get props => [pro_id, team_id, name, discription, created_at, finished_at, deleted_at ];
}
