// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/project/component/project_form.dart';
import 'package:front/app/domain/presentation/project/component/project_manager_selector.dart';
import 'package:front/app/domain/presentation/project/viewmodel/project.dart';
import 'package:front/core/const/enum.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/project/domain/entities/project_entity.dart';
import 'package:front/core/user/models/user.dart';
import 'package:front/i18n/strings.g.dart';
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

  final project = ProjectEntity(
    projectId: 1,
    name: 'name',
    description: 'description',
    managerId: 2,
    projectState: ProjectStateEnum.before,
  );

  @override
  ConsumerState<_Body> createState() => _BodyState();
}

class _BodyState extends ConsumerState<_Body> {
  late ProjectViewmodel viewmodel;
  final _formKey = GlobalKey<CustomFormState>();
  late CustomFormState? currentState;
  var manager =
      UserModel(id: 1, nickname: 'user1', email: 'email', type: 'type');
  final List<UserModel> teamMembers = [
    UserModel(id: 1, email: 'email', nickname: 'user1', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickname: 'user2', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickname: 'user3', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickname: 'user4', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickname: 'user5', type: 'MEMBER'),
  ];

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

  void onManagerChanged(UserModel user) {
    setState(() {
      manager = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    var strings = Translations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildHeader(strings),
            const SizedBox(height: 10),
            ProjectManagerSelector(
                teamMembers: teamMembers,
                manager: manager,
                onChanged: onManagerChanged),
            Expanded(
              child: ProjectForm(
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
                buildUpdateButton(strings),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader(Translations strings) {
    var t = strings.projectUpdateScreen;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.team['name'],
          style: widget.h1TextStyle,
        ),
        Text(
          t.editProjectTitle,
          style: widget.h1TextStyle,
        ),
        Text(t.editProjectDescription),
      ],
    );
  }

  Widget buildUpdateButton(Translations strings) {
    var t = strings.projectUpdateScreen;
    return TextButton(
      onPressed: () async {
        if (_formKey.currentState?.validate(null) ?? false) {
          var result = await viewmodel.updateProject(
              ProjectRequestModel(
                  managerId: 1,
                  name: _formKey.currentState!.fields['name']!.value,
                  description:
                      _formKey.currentState!.fields['description']!.value),
              widget.project.projectId);
          result.fold(
              (l) => debugPrint(l.toString()), (r) => debugPrint(r.toString()));
        }
      },
      child: Text(
        t.editButtonText,
        style: widget.h1TextStyle.copyWith(fontSize: 15),
      ),
    );
  }

  Widget buildDeleteButton(Translations strings) {
    var t = strings.projectUpdateScreen;
    return TextButton(
      onPressed: () async {
        var result = await viewmodel.deleteProject(widget.project.projectId);
        result.fold((l) => debugPrint(l.toString()), (r) => null);
      },
      child: Text(
        t.deleteButtonText,
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
