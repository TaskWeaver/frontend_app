// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';


// class TodoScreen extends ConsumerWidget {
//   const TodoScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 앱의 기본 구성
//     var dateTimeNow = DateTime.now();
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Todo List'),
//         ),
//         body: SingleChildScrollView(
//           child: Center(
//             // 팀 목록을 표시합니다.
//             child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         '오늘',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       Text(
//                         '${dateTimeNow.year}.${dateTimeNow.month}.${dateTimeNow.day}, (${getKoreanWeekday(dateTimeNow)})',
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                       const Divider(),
//                       ref.watch(teamListProvider).when(
//                           data: (teamList) => Column(
//                                 children: teamList
//                                     .map((team) => TeamWidget(team: team))
//                                     .toList(),
//                               ),
//                           loading: () => const CircularProgressIndicator(),
//                           error: (error, stack) => Text('Error: $error'))
//                     ])),
//           ),
//         ));
//   }

//   String getKoreanWeekday(DateTime date) {
//     var weekdays = <String>['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
//     // DateTime의 weekday는 1부터 시작하기 때문에, 인덱스에 맞추기 위해 1을 빼줍니다.
//     return weekdays[date.weekday - 1];
//   }
// }

// class TeamWidget extends ConsumerWidget {
//   const TeamWidget({super.key, required this.team});
//   final TeamEntity team;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 프로젝트 목록을 가져옵니다.
//     var projectList = ref.watch(projectListProvider(team.id));
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           team.name,
//           style: const TextStyle(fontSize: 14),
//         ),
//         projectList.when(
//           data: (projects) => Column(
//             children: projects
//                 .map((project) => Padding(
//                       padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
//                       child: ProjectWidget(project: project),
//                     ))
//                 .toList(),
//           ),
//           loading: () => const CircularProgressIndicator(),
//           error: (e, _) => const Text('Error loading projects'),
//         ),
//         const Divider()
//       ],
//     );
//   }
// }

// class ProjectWidget extends ConsumerWidget {
//   const ProjectWidget({super.key, required this.project});
//   final ProjectEntity project;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // 할 일 목록을 가져옵니다.
//     var todoList = ref.watch(todoListProvider(project.projectId));
//     return Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             project.name,
//             style: const TextStyle(fontSize: 14),
//           ),
//           todoList.when(
//             data: (todos) => Column(
//               children: todos
//                   .map((todo) => Padding(
//                         padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
//                         child: TodoCustomComponent(
//                           todo: todo,
//                         ),
//                       ))
//                   .toList(),
//             ),
//             loading: () => const CircularProgressIndicator(),
//             error: (e, _) => const Text('Error loading todos'),
//           )
//         ]);
//   }
// }
