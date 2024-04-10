import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/project/presentaion/viewmodel/project_viewmodel.dart';
import 'package:front/features/team/presentation/pages/team/widgets/dialog.dart';
import 'package:front/features/team/presentation/pages/team/widgets/selecting_sharing_method_dialog.dart';
import 'package:front/features/team/presentation/providers/projects_state.dart';
import 'package:front/features/team/presentation/providers/team_controller.dart';
import 'package:front/features/team/presentation/providers/team_detail_controller.dart';
import 'package:go_router/go_router.dart';

class TeamDetailView extends ConsumerStatefulWidget {
  final int teamId;

  TeamDetailView(this.teamId, {super.key});

  final elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(16.0),
    alignment: Alignment.centerLeft,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero)),
    backgroundColor: const Color(0xFFD9D9D9),
    foregroundColor: Colors.transparent,
  );

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
    ref
        .read(teamDetailControllerProvider.notifier)
        .getTeamById(widget.teamId);
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
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO: extract these widgets and move to component
              Text(
                ' 의 Board',
                style: textStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Team Member ',
                    style: textStyle.copyWith(fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () => context.dialog(
                      child: SelectingSharingMethodDialog(
                        teamId: widget.teamId,
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
    required this.widget,
    required this.textStyle,
    required this.projectsState,
  });

  final TeamDetailView widget;
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
                    onPressed: () {
                      context.push('/projectDetail/${widget.teamId}/${projects[index].projectId}');
                    },
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
      loading: () =>
      const Center(
        child: CircularProgressIndicator(),
      ),
      error: (message) {
        return Text(message ?? '');
      },
    );
  }
}
