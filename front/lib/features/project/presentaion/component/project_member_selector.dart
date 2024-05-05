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
    for (var element in widget.teamMembers) {
      membersState[element.id] = false;
    }
    membersState[widget.manager.id] = true;
  }

  void onMemberChanged(UserModel user) {
    setState(() {
      membersState[user.id] = !membersState[user.id]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('프로젝트 멤버'),
        GestureDetector(
          onTap: () =>
              _buildProjectMemberSelectDialog(context, widget.teamMembers),
          child: _buildTeamMemberList(widget.teamMembers),
        ),
      ],
    );
  }

  Widget _buildTeamMemberList(List<UserModel> members) {
    return ListView.builder(itemBuilder: (
      context,
      index,
    ) {
      return Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Text(members[index].nickName),
          ),
        ],
      );
    });
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
