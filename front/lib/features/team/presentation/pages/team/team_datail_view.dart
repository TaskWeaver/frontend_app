import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/project/presentaion/viewmodel/project_viewmodel.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/team_detail.dart';
import 'package:front/features/team/presentation/pages/team/widgets/dialog.dart';
import 'package:front/features/team/presentation/pages/team/widgets/selecting_sharing_method_dialog.dart';
import 'package:front/features/team/presentation/providers/projects_state.dart';
import 'package:front/features/team/presentation/providers/team_controller.dart';
import 'package:front/features/team/presentation/providers/team_detail_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:front/features/user/presentation/viewmodel/main_screen_viewmodel.dart';

class TeamDetailView extends ConsumerStatefulWidget {
  final int teamId;

  const TeamDetailView(this.teamId, {super.key});

  @override
  ConsumerState<TeamDetailView> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends ConsumerState<TeamDetailView> {
  late ProjectViewmodel viewmodel;
  late TeamController teamController;
  final memberIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewmodel = ref.read(projectViewmodelProvider(widget.teamId).notifier);
    viewmodel.getProjectsByTeamId(1);
    ref.read(teamDetailControllerProvider.notifier).getTeamById(widget.teamId);
  }

  @override
  Widget build(BuildContext context) {
    var projectsState = ref.watch(projectViewmodelProvider(widget.teamId));
    // final mainScreenViewModelState = ref.watch(mainScreenViewModelProvider);
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
              Expanded(
                child: ProjectList(
                    widget: widget,
                    textStyle: textStyle,
                    projectsState: projectsState),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          onPressed: () => context.push('/projectCreate/${widget.teamId}'),
          child: const Icon(Icons.add),
        ));
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({
    super.key,
    required this.textStyle,
    required this.projectsState,
    required this.widget,
  });

  final TextStyle textStyle;
  final ProjectsState projectsState;
  final TeamDetailView widget;

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
                    onPressed: () {
                      context.push(
                          '/projectDetail/${widget.teamId}/${projects[index].projectId}');
                    },
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
