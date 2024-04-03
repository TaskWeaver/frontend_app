import 'package:flutter/material.dart';
import 'package:front/shared/atom/bottom_navigation_bar.dart';
import 'package:front/shared/utils/intl_format_date.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const _Body(),
      floatingActionButton: const _AddTaskButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: const ProjectBottomNavigationBar(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var projectName = 'title';
    var projectStartTime = DateTime.now();
    var projectTask = [];
    var h1Textstyle =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$projectName의 TimeLine',
                style: h1Textstyle,
              ),
              Text('${intlFormatDate(projectStartTime)}~'),
              const Text('프로젝트 설명'),
              //  for (int i = 0; i < projectTask.length; i++)
              //  TaskComponent(task: projectTask[i])
            ],
          ),
        ),
      ),
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
  return const ProjectDetailScreen();
}
