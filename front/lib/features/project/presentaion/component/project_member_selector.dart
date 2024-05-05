import 'package:flutter/material.dart';
import 'package:front/features/team/presentation/pages/team/widgets/dialog.dart';
import 'package:front/features/user/data/models/user.dart';

typedef VoidCallback = void Function(List<int> projectMemberIdList);

class ProjectMemberSelector extends StatefulWidget {
  const ProjectMemberSelector(
      {Key? key,
      required this.teamMembers,
      required this.manager,
      required this.onChanged})
      : super(key: key);

  final List<UserModel> teamMembers;
  final UserModel manager;
  final VoidCallback onChanged;

  @override
  State<ProjectMemberSelector> createState() => _ProjectMemberSelectorState();
}

class _ProjectMemberSelectorState extends State<ProjectMemberSelector> {
  late Map<int, bool> membersState = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      for (var element in widget.teamMembers) {
        membersState[element.id] = false;
      }
      membersState[widget.manager.id] = true;
    });
    debugPrint('membersState: $membersState');
  }

  void onMemberChanged(UserModel user) {
    setState(() {
      membersState[user.id] = !membersState[user.id]!;
      membersState = Map.from(membersState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('프로젝트 멤버'),
        SizedBox(
            height: 50,
            child: Row(
              children: [
                ..._buildTeamMemberList(widget.teamMembers),
              ],
            )),
      ],
    );
  }

  List<Widget> _buildTeamMemberList(List<UserModel> teamMembers) {
    var result = <Widget>[];
    for (var i = 0; i < teamMembers.length; i++) {
      debugPrint(
          'memberId: ${teamMembers[i].id} membersState: ${membersState[teamMembers[i].id]}');
      if (membersState[teamMembers[i].id] == true) {
        result.add(GestureDetector(
            child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Text(teamMembers[i].nickName),
        )));
      }
    }
    result.add(GestureDetector(
        onTap: () => _buildProjectMemberSelectDialog(context, teamMembers),
        child: CircleAvatar(
          backgroundColor: Colors.grey[500],
          child: Text('+'),
        )));
    return result;
  }

  void _buildProjectMemberSelectDialog(
      BuildContext context, List<UserModel> teamMembers) {
    context.dialog(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('프로젝트 담당자를 변경하시겠습니까?'),
          ..._buildMemberTileList(context, teamMembers),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              var projectMembers = <int>[];
              membersState.forEach((key, value) {
                if (value) {
                  projectMembers.add(key);
                }
              });
              widget.onChanged(projectMembers);
            },
            child: const Text('닫기'),
          ),
        ],
      ),
    ));
  }

  List<Widget> _buildMemberTileList(
      BuildContext context, List<UserModel> teamMembers) {
    // ignore: omit_local_variable_types
    List<Widget> result = [];
    for (var i = 0; i < teamMembers.length; i++) {
      result.add(_buildMemberTile(teamMembers[i], context));
    }
    return result;
  }

  GestureDetector _buildMemberTile(UserModel user, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => onMemberChanged(user),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: membersState[user.id]!
              ? colorScheme.primary
              : colorScheme.background,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(
                width: 5,
              ),
              Text(user.nickName ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
