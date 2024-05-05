// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/locator.dart';
import 'package:front/core/utils/result.dart';
import 'package:front/features/project/data/models/project_create_model.dart';
import 'package:front/features/project/presentaion/component/project_from.dart';
import 'package:front/features/project/presentaion/component/project_manager_selector.dart';
import 'package:front/features/project/presentaion/component/project_member_selector.dart';
import 'package:front/features/project/presentaion/viewmodel/project_viewmodel.dart';
import 'package:front/features/team/data/models/team_detail_member_model.dart';
import 'package:front/features/user/data/models/user.dart';
import 'package:front/shared/atom/bottom_navigation_bar.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ProjectCreateScreen extends ConsumerStatefulWidget {
  ProjectCreateScreen({
    Key? key,
    required this.teamId,
  }) : super(key: key);

  final int teamId;

  final team = {
    'id': 9,
    'name': 'Team Name',
  };

  final TextStyle h1TextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  ConsumerState<ProjectCreateScreen> createState() =>
      _ProjectCreateScreenState();
}

class _ProjectCreateScreenState extends ConsumerState<ProjectCreateScreen> {
  late ProjectViewmodel viewmodel;
  final _formKey = GlobalKey<CustomFormState>();
  late CustomFormState? currentState;
  var manager = UserModel(
    id: 4,
    nickName: '코난',
    email: 'test@gmail.com',
    type: 'LEADER',
  );
  final List<UserModel> teamMembers = [
    UserModel(id: 4, email: '코난', nickName: 'test@gmail.com', type: 'LEADER'),
  ];

  var projectMemberIdLsit = <int>[];

  @override
  void initState() {
    super.initState();
    projectMemberIdLsit.add(manager.id);
    currentState = _formKey.currentState;
    viewmodel = ref.read(projectViewmodelProvider(widget.teamId).notifier);
  }

  @override
  Widget build(BuildContext context) {
    var users = getTeamMembersByTeamIdUseCase(teamId: widget.teamId);
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
                FutureBuilder(
                    future: users,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return snapshot.data?.fold(
                                onSuccess: (users) => ProjectManagerSelector(
                                      teamMembers: users,
                                      manager: manager,
                                      onChanged: onManagerChanged,
                                    ),
                                onFailure: (e) => Text('e')) ??
                            Text('no Data');
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                FutureBuilder(
                    future: users,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return snapshot.data?.fold(
                                onSuccess: (users) => ProjectMemberSelector(
                                      teamMembers: users,
                                      manager: manager,
                                      onChanged: onProjectMemberChanged,
                                    ),
                                onFailure: (e) => Text('e')) ??
                            Text('no Data');
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
                Expanded(
                  child: ProjectFrom(
                    formKey: _formKey,
                    onFormChanged: onFormChanged,
                  ),
                ),
                const SizedBox(height: 20),
                buildCreateButton(widget.teamId),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const ProjectBottomNavigationBar(),
    );
  }

  void onFormChanged() {
    setState(() {
      currentState = _formKey.currentState;
    });
  }

  void onManagerChanged(UserModel user) {
    setState(() {
      manager = user;
      if (!projectMemberIdLsit.contains(user.id)) {
        projectMemberIdLsit = [user.id, ...projectMemberIdLsit];
      }
    });
  }

  void onProjectMemberChanged(List<int> memberIdList) {
    setState(() {
      projectMemberIdLsit = memberIdList;
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
          'Project 추가하기',
          style: widget.h1TextStyle,
        ),
        const Text('새로운 프로젝트를 추가해보세요'),
      ],
    );
  }

  Row buildCreateButton(int teamId) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () async {
            if (_formKey.currentState?.validate(null) ?? false) {
              try {
                await viewmodel.createProject(
                    ProjectCreateModel(
                      managerId: manager.id,
                      memberIdList: [manager.id],
                      name: currentState!.fields['name']!.value,
                      description: currentState!.fields['description']!.value,
                    ),
                    teamId);
                context.pop();
              } catch (e) {
                debugPrint(e.toString());
              }
            }
          },
          child: Text(
            '생성',
            style: widget.h1TextStyle.copyWith(fontSize: 15),
          ),
        ),
      ],
    );
  }
}

//component

@widgetbook.UseCase(
  name: '',
  type: ProjectCreateScreen,
)
Widget projectCreateScreenUseCase(BuildContext context) {
  return ProjectCreateScreen(teamId: 1);
}
