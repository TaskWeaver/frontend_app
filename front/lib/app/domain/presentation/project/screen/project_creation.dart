// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/project/component/project_form.dart';
import 'package:front/app/domain/presentation/project/component/project_manager_selector.dart';
import 'package:front/app/domain/presentation/project/viewmodel/project.dart';
import 'package:front/core/project/data/models/project_request.dart';
import 'package:front/core/user/models/user.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/shared/atom/bottom_navigation_bar.dart';
import 'package:front/shared/helper/FormHelper/form.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class ProjectCreationScreen extends StatelessWidget {
  ProjectCreationScreen({
    Key? key,
  }) : super(key: key);

  final team = {
    'id': 1,
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
  const _Body({
    Key? key,
    required this.team,
  }) : super(key: key);

  final Map<String, dynamic> team;

  final TextStyle h1TextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

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
    var translations = Translations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildHeader(translations),
            const SizedBox(height: 10),
            ProjectManagerSelector(
                teamMembers: teamMembers,
                manager: manager,
                onChanged: onManagerChanged),
            Expanded(
              child: ProjectForm(
                formKey: _formKey,
                onFormChanged: onFormChanged,
              ),
            ),
            const SizedBox(height: 20),
            buildCreateButton(translations),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(Translations translations) {
    var t = translations.projectCreationScreen;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.team['name'],
          style: widget.h1TextStyle,
        ),
        Text(
          t.addProjectHeader,
          style: widget.h1TextStyle,
        ),
        Text(t.addProjectDescription),
      ],
    );
  }

  Row buildCreateButton(Translations translations) {
    var t = translations.projectCreationScreen;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () async {
            if (_formKey.currentState?.validate(null) ?? false) {
              var result = await viewmodel.createProject(
                ProjectRequestModel(
                  managerId: manager.id,
                  name: currentState!.fields['name']!.value,
                  description: currentState!.fields['description']!.value,
                ),
                widget.team['id'],
              );
              result.fold((l) => debugPrint(l.toString()),
                  (r) => debugPrint(r.toString()));
            }
          },
          child: Text(
            t.createButton,
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
  type: ProjectCreationScreen,
)
Widget projectCreationScreenUseCase(BuildContext context) {
  return ProjectCreationScreen();
}
