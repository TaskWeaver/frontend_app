// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/project/component/project_from.dart';
import 'package:front/app/domain/presentation/project/viewmodel/project.dart';
import 'package:front/core/project/domain/entities/project.dart';
import 'package:front/shared/atom/bottom_navigation_bar.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ProjectUpdateScreen extends StatelessWidget {
  ProjectUpdateScreen({
    Key? key,
  }) : super(key: key);

  final team = {
    'id': '1',
    'name': '팀이름',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _Body(team: team),
      ),
      bottomNavigationBar: const ProjectBottomNavigationBar(),
    );
  }
}
//view

class _Body extends ConsumerStatefulWidget {
  _Body({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Map<String, dynamic> team;

  final TextStyle h1TextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  final project = Project(
    pro_id: 'pro_id',
    team_id: 'team_id',
    name: 'name',
    description: 'description',
    created_at: DateTime(2020, 10, 10, 14, 58, 4),
    finished_at: DateTime(2020, 10, 10, 14, 58, 4),
    deleted_at: DateTime(2020, 10, 10, 14, 58, 4),
  );

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  late ProjectViewmodel viewmodel;
  final _formKey = GlobalKey<CustomFormState>();
  late CustomFormState? currentState;

  @override
  void initState() {
    super.initState();
    currentState = _formKey.currentState;
    viewmodel = ref.read(projectViewmodelProvider.notifier);
  }

  void onFormChanged() {
    setState(() {
      currentState = _formKey.currentState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildHeader(),
            const SizedBox(height: 10),
            Expanded(
              child: ProjectFrom(
                formKey: _formKey,
                onFormChanged: onFormChanged,
                initialValue: {
                  'name': widget.project.name,
                  'description': widget.project.description,
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                buildUpdateButton(),
              ],
            )
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
          widget.team['name'],
          style: widget.h1TextStyle,
        ),
        Text(
          'Project 추가하기',
          style: widget.h1TextStyle,
        ),
        const Text('새로운 프로젝트를 추가해보세요'),
      ],
    );
  }

  Widget buildUpdateButton() {
    return TextButton(
      onPressed: () async {
        if (_formKey.currentState?.validate(null) ?? false) {
          var result = await viewmodel.updateProject(widget.project.copyWith(
            name: _formKey.currentState!.fields['name']!.value,
            description: _formKey.currentState!.fields['description']!.value,
          ));
          result.fold(
              (l) => debugPrint(l.toString()), (r) => debugPrint(r.toString()));
        }
      },
      child: Text(
        '수정',
        style: widget.h1TextStyle.copyWith(fontSize: 15),
      ),
    );
  }
}

//component

@widgetbook.UseCase(
  name: '',
  type: ProjectUpdateScreen,
)
Widget projectCreationScreenUseCase(BuildContext context) {
  return ProjectUpdateScreen();
}