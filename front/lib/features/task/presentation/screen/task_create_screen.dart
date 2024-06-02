import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/task/presentation/component/picker_component.dart';
import 'package:front/features/task/presentation/component/task_create_form_component.dart';
import 'package:front/features/task/presentation/component/task_member_adder_component.dart';
import 'package:front/features/user/data/models/user_model.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/shared/helper/FormHelper/form.dart';

class TaskCreateScreen extends StatelessWidget {
  TaskCreateScreen({
    Key? key,
  }) : super(key: key);

  final project = {
    'id': 1,
    'name': 'Project',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _Body(project: project),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({super.key, required this.project});

  final Map<String, dynamic> project;

  final TextStyle h1TextStyle = const TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  ConsumerState<_Body> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends ConsumerState<_Body> {
  @override
  final _formKey = GlobalKey<CustomFormState>();
  late CustomFormState? currentState;
  List<UserModel> members = [];
  final List<UserModel> projectMembers = [
    UserModel(id: 1, email: 'email', nickName: 'user1', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickName: 'user2', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickName: 'user3', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickName: 'user4', type: 'MEMBER'),
    UserModel(id: 1, email: 'email', nickName: 'user5', type: 'MEMBER'),
  ];

  @override
  void initState() {
    super.initState();
    currentState = _formKey.currentState;
  }

  void onFormChanged() {
    setState(() {
      currentState = _formKey.currentState;
    });
  }

  void onMembersChanged(UserModel member) {
    setState(() {
      members.add(member);
    });
  }

  @override
  Widget build(BuildContext context) {
    var translations = Translations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          children: [
            buildHeader(translations),
            const SizedBox(height: 10),
            const Picker(label: 'Icon'),
            TaskCreateForm(formKey: _formKey, onFormChanged: onFormChanged),
            TaskMemberAdder(
                projectMembers: projectMembers,
                taskMembers: members,
                onChanged: onMembersChanged),
            const Picker(label: '파일 첨부'),
            const SizedBox(height: 20),
            buildCreateButton(translations),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(Translations translations) {
    var t = translations.projectCreateScreen;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${widget.project['name']}의 TimeLine',
          style: widget.h1TextStyle,
        ),
        Text(t.addProjectDescription),
      ],
    );
  }

  Row buildCreateButton(Translations translations) {
    var t = translations.projectCreateScreen;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () async {},
          child: Text(
            t.createButton,
            style: widget.h1TextStyle.copyWith(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
