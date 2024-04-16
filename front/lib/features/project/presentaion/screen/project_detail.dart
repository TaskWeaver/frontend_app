import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/project/presentaion/component/task_component.dart';
import 'package:front/features/project/presentaion/viewmodel/project_viewmodel.dart';
import 'package:front/shared/atom/bottom_navigation_bar.dart';
import 'package:front/shared/utils/intl_format_date.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ProjectDetailScreen extends ConsumerStatefulWidget {
  const ProjectDetailScreen(
      {super.key, required this.projectId, required this.teamId});

  final int projectId;
  final int teamId;

  @override
  ConsumerState<ProjectDetailScreen> createState() =>
      _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen> {
  late ProjectViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = ref.read(projectViewmodelProvider(widget.teamId).notifier);
    viewmodel.getProjectById(widget.projectId);
  }

  Widget buildDeleteButton() {
    return TextButton(
      onPressed: () async {
        try {
          await viewmodel.deleteProject(widget.projectId);
          context.pop();
        } catch (e) {
          debugPrint(e.toString());
        }
      },
      child: Text(
        '삭제',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var projectState = viewmodel.getProjectById(widget.projectId);
    var projectStartTime = DateTime.now();
    var projectTask = [];
    var h1Textstyle =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: projectState,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var project = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${project.name}의 TimeLine',
                        style: h1Textstyle,
                      ),
                      Text('${intlFormatDate(projectStartTime)}~'),
                      Text(project.description),
                      for (int i = 0; i < projectTask.length; i++)
                        TaskComponent(task: projectTask[i]),
                      TextButton(
                        child: Text('수정'),
                        onPressed: () => context.push(
                            '/projectUpdate/${widget.teamId}',
                            extra: project),
                      ),
                      buildDeleteButton(),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: const _AddTaskButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const ProjectBottomNavigationBar(),
    );
  }
}

class _AddTaskButton extends StatelessWidget {
  const _AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      onPressed: () {
        // Task 추가 로직을 이곳에 구현합니다.
      },
      child: const Text('Task 추가하기'),
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: ProjectDetailScreen,
)
Widget ProjectDetailScreenUseCase(BuildContext context) {
  return ProjectDetailScreen(
    projectId: 1,
    teamId: 1,
  );
}
