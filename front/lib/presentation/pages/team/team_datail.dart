import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/data/models/team_detail.dart';
import 'package:front/features/team/state/projects_state.dart';
import 'package:front/features/team/viewmodel/team_detail.dart';
import 'package:front/presentation/pages/team/widgets/dialog.dart';
import 'package:front/presentation/pages/team/widgets/selecting_sharing_method_dialog.dart';
import 'package:front/presentation/providers/team_controller.dart';

class TeamDetailScreen extends ConsumerStatefulWidget {
  final String teamId;

  TeamDetailScreen(this.teamId, {super.key});

  final elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(16.0),
    alignment: Alignment.centerLeft,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero)),
    backgroundColor: const Color(0xFFD9D9D9),
    foregroundColor: Colors.transparent,
  );

  @override
  ConsumerState<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends ConsumerState<TeamDetailScreen> {
  late TeamDetailViewmodel viewmodel;
  late TeamController teamController;

  @override
  void initState() {
    super.initState();
    viewmodel = ref.read(teamDetailViewmodelProvider.notifier);
    viewmodel.getProjectsByTeamId(1);
    ref
        .read(teamControllerProvider.notifier)
        .getTeamById(int.parse(widget.teamId));
  }

  @override
  Widget build(BuildContext context) {
    var projectsState = ref.watch(teamDetailViewmodelProvider);
    final teamState = ref.watch(teamControllerProvider);

    var textStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'TeamW2aver',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                ),
                Text(
                  '알림',
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      body: teamState.when(
        (teamDetailModel) {
          teamDetailModel as TeamDetailModel;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO: extract these widgets and move to component
                Text(
                  '${teamDetailModel.name} 의 Board',
                  style: textStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Team Member (${teamDetailModel.memberCount})',
                      style: textStyle.copyWith(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () => context.dialog(
                        child: SelectingSharingMethodDialog(
                          teamId: int.parse(widget.teamId),
                        ),
                      ),
                      child: const Text('share'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemExtent: 48,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: OvalBorder(),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                  child: Text(
                    'Team Project',
                    style: textStyle.copyWith(fontSize: 15),
                  ),
                ),
                Expanded(
                  child: ProjectList(
                      widget: widget,
                      textStyle: textStyle,
                      projectsState: projectsState),
                ),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (message) => Text(message ?? ''),
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({
    super.key,
    required this.widget,
    required this.textStyle,
    required this.projectsState,
  });

  final TeamDetailScreen widget;
  final TextStyle textStyle;
  final ProjectsState projectsState;

  @override
  Widget build(BuildContext context) {
    return projectsState.when(
      (projects) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverList.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: widget.elevatedButtonStyle,
                    child: Text(
                      projects[index].name,
                      style: textStyle.copyWith(fontSize: 15),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (message) {
        return Text(message ?? '');
      },
    );
  }
}
