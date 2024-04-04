import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/core/const/enum.dart';
import 'package:front/features/project/entities/project.dart';
import 'package:front/features/project/presentaion/component/task_component.dart';
import 'package:front/features/project/presentaion/viewmodel/project.dart';
import 'package:front/shared/atom/bottom_navigation_bar.dart';
import 'package:front/shared/utils/intl_format_date.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ProjectDetailScreen extends ConsumerStatefulWidget {
  const ProjectDetailScreen({super.key, required this.projectId});

  final int projectId;

  @override
  ConsumerState<ProjectDetailScreen> createState() =>
      _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen> {
  late ProjectViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = ref.read(projectViewmodelProvider.notifier);
    viewmodel.getProjectById(widget.projectId);
  }

  @override
  Widget build(BuildContext context) {
    var projectState = ref.watch(projectViewmodelProvider);
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
            child: projectState.when(
              (project) => Column(
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
                    child: Text('수정d'),
                    onPressed: () =>
                        context.push('/projectUpdate', extra: project),
                  )
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (message) => Text(message.toString()),
              
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
      projectId: 1);
}
