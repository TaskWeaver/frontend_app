import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:front/features/team/viewmodel/selected_team_project_list_provider.dart';
import 'package:front/features/team/viewmodel/selected_team_provider.dart';
import 'package:front/shared/theme/theme.dart';
import 'package:go_router/go_router.dart';

class TeamDetailScreen extends ConsumerWidget {
  const TeamDetailScreen({super.key, required this.teamId});
  final String teamId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('팀 관리'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          children: [
            TeamCard(
              teamId: teamId,
            ),
            ProjectCardList(
              teamId: teamId,
            ),
          ],
        ),
      ),
    );
  }
}

class TeamCard extends ConsumerStatefulWidget {
  const TeamCard({super.key, required this.teamId});

  final String teamId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamCardState();
}

class _TeamCardState extends ConsumerState<TeamCard> {
  @override
  Widget build(BuildContext context) {
    var selectedTeam =
        ref.watch(selectedTeamProvider(int.parse(widget.teamId)));
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Theme.of(context).primaryColor,
      child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: selectedTeam.when(
                data: (value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(value.name,
                            style: themeData.textTheme.headlineMedium!.copyWith(
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(value.description ?? '',
                            style: themeData.textTheme.headlineMedium!.copyWith(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) => Text('Error: $error'),
                loading: () => const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
          )),
    );
  }
}

class ProjectCardList extends ConsumerStatefulWidget {
  const ProjectCardList({super.key, required this.teamId});
  final String teamId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectCardListState();
}

class _ProjectCardListState extends ConsumerState<ProjectCardList> {
  @override
  Widget build(BuildContext context) {
    var selectedTeamProjectList =
        ref.watch(selectedTeamProjectListProvider(int.parse(widget.teamId)));

    return selectedTeamProjectList.when(
      data: (value) {
        return Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: [
                  Text(
                    '프로젝트',
                    style: themeData.textTheme.labelMedium!
                        .copyWith(color: Colors.black),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      context.go('/team/${widget.teamId}/project/create');
                    },
                  ),
                ],
              ),
            ),
            if (value.isEmpty)
              Card(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Center(
                        child: Text(
                          '프로젝트를 추가해주세요',
                          style: themeData.textTheme.bodyMedium!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            else ...[
              for (var project in value)
                ProjectCard(project: project, teamId: widget.teamId),
            ],
          ],
        );
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (error, stack) {
        return Text('Error: $error');
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project, required this.teamId});
  final ProjectModel project;
  final String teamId;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          context.go('/team/$teamId/project/${project.projectId}');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  project.name,
                  style: themeData.textTheme.bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              )),
        ),
      ),
    );
  }
}
