// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/project/component/custom_text_field.dart';
import 'package:front/app/domain/presentation/project/component/project_administrator.dart';
import 'package:front/app/domain/presentation/project/shared/atom/bottom_navigation_bar.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ProjectCreationScreen extends StatelessWidget {
  const ProjectCreationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _Body(teamName: '팀이름'),
      ),
      bottomNavigationBar: const ProjectBottomNavigationBar(),
    );
  }
}

String? projectValidator(String? val) {
  return null;
}

//view

class _Body extends StatelessWidget {
  _Body({
    Key? key,
    required this.teamName,
  }) : super(key: key);
  final String teamName;

  final TextStyle h1TextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  String? projectTitle;
  String? projectContent;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            const SizedBox(height: 10),
            const ProjectAdministrator(),
            buildProjectTitleField(),
            buildProjectContentField(),
            const SizedBox(height: 20),
            buildCreateButton(),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          teamName,
          style: h1TextStyle,
        ),
        Text(
          'Project 추가하기',
          style: h1TextStyle,
        ),
        const Text('새로운 프로젝트를 추가해보세요'),
      ],
    );
  }

  Widget buildProjectTitleField() {
    return Expanded(
      flex: 0,
      child: CustomTextField(
        title: '프로젝트 제목',
        onSaved: (val) => projectTitle = val,
        validator: projectValidator,
      ),
    );
  }

  Widget buildProjectContentField() {
    return Expanded(
      flex: 1,
      child: CustomTextField(
        title: '프로젝트 내용',
        expanded: true,
        onSaved: (val) => projectContent = val,
        validator: projectValidator,
      ),
    );
  }

  Row buildCreateButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text(
            '생성',
            style: h1TextStyle.copyWith(fontSize: 15),
          ),
        ),
      ],
    );
  }
}

//component

@widgetbook.UseCase(
  name: '',
  type: ProjectCreationScreen,
)
Widget projectCreationScreenUseCase(BuildContext context) {
  return const ProjectCreationScreen();
}
