// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/project/entities/project_entity.dart';
import 'package:front/features/project/presentaion/component/project_from.dart';
import 'package:front/features/project/presentaion/component/project_manager_selector.dart';
import 'package:front/features/project/presentaion/viewmodel/project_viewmodel.dart';
import 'package:front/features/user/models/user.dart';
import 'package:front/shared/atom/bottom_navigation_bar.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:go_router/go_router.dart';

class ProjectUpdateScreen extends ConsumerStatefulWidget {
  ProjectUpdateScreen({Key? key, required this.project, required this.teamId})
      : super(key: key);

  final Project project;
  final int teamId;

  final team = {
    'id': 1,
    'name': '팀이름',
  };

  final TextStyle h1TextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  ConsumerState<ProjectUpdateScreen> createState() =>
      _ProjectUpdateScreenState();
}

class _ProjectUpdateScreenState extends ConsumerState<ProjectUpdateScreen> {
  late ProjectViewmodel viewmodel;
  final _formKey = GlobalKey<CustomFormState>();
  late CustomFormState? currentState;
  var manager =
      UserModel(id: 1, nickname: 'user1', email: 'email', type: 'type');
  final List<UserModel> teamMembers = [
    UserModel(id: 4, email: 'email', nickname: 'user1', type: 'MEMBER'),
    UserModel(id: 4, email: 'email', nickname: 'user2', type: 'MEMBER'),
    UserModel(id: 4, email: 'email', nickname: 'user3', type: 'MEMBER'),
    UserModel(id: 4, email: 'email', nickname: 'user4', type: 'MEMBER'),
    UserModel(id: 4, email: 'email', nickname: 'user5', type: 'MEMBER'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                buildHeader(),
                const SizedBox(height: 10),
                ProjectManagerSelector(
                    teamMembers: teamMembers,
                    manager: manager,
                    onChanged: onManagerChanged),
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
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavigationBar(),
    );
  }

  @override
  void initState() {
    super.initState();
    currentState = _formKey.currentState;
    viewmodel = ref.read(projectViewmodelProvider(widget.teamId).notifier);
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

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.team['name'].toString(),
          style: widget.h1TextStyle,
        ),
        Text(
          'Project 수정하기',
          style: widget.h1TextStyle,
        ),
        const Text('프로젝트를 수정해보세요'),
      ],
    );
  }

  Widget buildUpdateButton() {
    return TextButton(
      onPressed: () async {
        if (_formKey.currentState?.validate(null) ?? false) {
          try {
            await viewmodel.updateProject(
                Project(
                    managerId: manager.id,
                    name: _formKey.currentState!.fields['name']!.value,
                    description:
                        _formKey.currentState!.fields['description']!.value,
                    projectId: widget.project.projectId,
                    projectState: widget.project.projectState),
                widget.project.projectId);
            context.pop();
          } catch (e) {
            debugPrint(e.toString());
          }
        }
      },
      child: Text(
        '수정',
        style: widget.h1TextStyle.copyWith(fontSize: 15),
      ),
    );
  }
}

// //component

// @widgetbook.UseCase(
//   name: '',
//   type: ProjectUpdateScreen,
// )
// Widget projectCreateScreenUseCase(BuildContext context) {
//   return ProjectUpdateScreen();
// }
