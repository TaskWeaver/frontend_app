import 'package:front/core/assiners/entity.dart/assiner.dart';
import 'package:front/core/const/enum.dart';
import 'package:front/core/project/domain/entities/project_entity.dart';
import 'package:front/core/team/domain/team_entity.dart';
import 'package:front/core/todo/entity/todo_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'temp_provider.g.dart';

@riverpod
Future<List<TeamEntity>> teamList(TeamListRef ref) async {
  return [
    TeamEntity(
      id: 1,
      name: 'Team 1',
      inviteLink: 'abc',
      teamLeader: '홍길동',
      createdAt: DateTime.now(),
    ),
    TeamEntity(
      id: 2,
      name: 'Team 2',
      inviteLink: 'def',
      teamLeader: '곽철용',
      createdAt: DateTime.now(),
    )
  ];
}

@riverpod
Future<List<ProjectEntity>> projectList(ProjectListRef ref, int teamId) async {
  return [
    ProjectEntity(
      name: '프로젝트명',
      description: 'description',
      managerId: 2,
      projectState: ProjectStateEnum.onProgress,
      projectId: 1,
    ),
    ProjectEntity(
      name: '프로젝트명',
      description: 'description',
      managerId: 2,
      projectState: ProjectStateEnum.before,
      projectId: 2,
    ),
  ];
}

@riverpod
Future<List<TodoEntity>> todoList(TodoListRef ref, int projectId) async {
  return [
    TodoEntity(
      assigners: [Assiner(name: '홍길동'), Assiner(name: '곽철용')],
      description: 'description',
      title: '제안서 1차 완성하기',
      dueDate: DateTime.now(),
    ),
    TodoEntity(
      assigners: [Assiner(name: '배용만'), Assiner(name: '곽주팔')],
      description: 'description',
      title: '제안서 2차 완성하기',
      dueDate: DateTime.now(),
    ),
  ];
}
