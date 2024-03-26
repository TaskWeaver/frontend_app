import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/project/component/task_component.dart';
import 'package:front/i18n/strings.g.dart'; // 수정: 생성된 번역 파일 import
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
    var projectName = 'Flutter 프로젝트'; // 예시 프로젝트 이름
    var projectDescription = '프로젝트 설명'; // 예시 프로젝트 설명
    var projectStartTime = DateTime.now();
    var projectTask = [];
    var t = Translations.of(context).projectDetailScreen; // 수정: 번역 객체 접근
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
                t.timelineTitle(projectName: projectName),
                style: h1Textstyle,
              ),
              Text(
                  t.projectStartDate(
                      projectStartDate:
                          intlFormatDate(projectStartTime)), // 수정: 시작 날짜 포맷 변경
                  style: const TextStyle()),
              Text(projectDescription),
              for (int i = 0; i < projectTask.length; i++)
                TaskComponent(task: projectTask[i])
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
    var t = Translations.of(context).projectDetailScreen; // 수정: 번역 객체 접근
    return FloatingActionButton(
      backgroundColor: Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      onPressed: () {
        // Task 추가 로직을 이곳에 구현합니다.
      },
      child: Text(t.addTaskButton), // 수정: 번역된 문자열 사용
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
