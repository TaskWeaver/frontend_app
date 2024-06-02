import 'package:flutter/material.dart';
import 'package:front/features/team/presentation/pages/team/widgets/dialog.dart';
import 'package:front/features/user/data/models/user_model.dart';
import 'package:front/i18n/strings.g.dart';

typedef VoidCallback = void Function(UserModel user);

class TaskMemberAdder extends StatelessWidget {
  const TaskMemberAdder(
      {Key? key,
      required this.projectMembers,
      required this.taskMembers,
      required this.onChanged})
      : super(key: key);

  final List<UserModel> projectMembers;
  final List<UserModel> taskMembers;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context).projectManagerSelector;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.projectManager),
        SizedBox(height: 80, child: _buildAdministratorRow(context)),
      ],
    );
  }

  Widget _buildAdministratorRow(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () =>
              context.dialog(child: _buildDialog(context, projectMembers)),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: const Text('+'),
          ),
        ),
        ListView.builder(
          itemCount: taskMembers.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Text(taskMembers[index].nickName[0].toUpperCase()),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDialog(BuildContext context, List<UserModel> teamMembers) {
    var t = Translations.of(context).projectManagerSelector;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(t.projectManager),
          ..._buildAssignerComponets(context, teamMembers),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.cancelButton),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildAssignerComponets(
      BuildContext context, List<UserModel> teamMembers) {
    // ignore: omit_local_variable_types
    List<Widget> result = [];
    for (var i = 0; i < teamMembers.length; i++) {
      result.add(_buildAssignerComponent(teamMembers[i], context));
    }
    return result;
  }

  GestureDetector _buildAssignerComponent(
      UserModel user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(user);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(
              width: 5,
            ),
            Text(user.nickName),
          ],
        ),
      ),
    );
  }
}
