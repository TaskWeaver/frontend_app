import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/team/componet/dialog.dart';
import 'package:front/core/user/models/user.dart';
import 'package:front/i18n/strings.g.dart';

typedef VoidCallback = void Function(UserModel user);

class ProjectManagerSelector extends StatelessWidget {
  const ProjectManagerSelector(
      {Key? key,
      required this.teamMembers,
      required this.manager,
      required this.onChanged})
      : super(key: key);

  final List<UserModel> teamMembers;
  final UserModel manager;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context).projectManagerSelector;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.projectManager),
        GestureDetector(
          onTap: () => _setAdministrator(context, teamMembers),
          child: _buildAdministratorRow(manager),
        ),
      ],
    );
  }

  Row _buildAdministratorRow(UserModel administrator) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: const Text('⭐'),
        ),
        Text(administrator.nickname),
      ],
    );
  }

  void _setAdministrator(BuildContext context, List<UserModel> teamMembers) {
    context.dialog(child: _buildDialog(context, teamMembers));
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
      onTap: () => _showInformationDialog(user, context),
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
            Text(user.nickname),
          ],
        ),
      ),
    );
  }

  void _showInformationDialog(UserModel user, BuildContext context) {
    var t = Translations.of(context).projectManagerSelector;

    context.dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(t.changeConfirmationMessage(userName: user.nickname)),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onChanged(user);
                      _showConfirmationDialog(user.nickname, context);
                    },
                    child: Text(t.confirmationButton)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(t.cancelButton),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(String assignerName, BuildContext context) {
    var t = Translations.of(context).projectManagerSelector;

    context.dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(t.changeConfirmationMessage(userName: assignerName)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(t.closeButton),
          ),
        ],
      ),
    );
  }
}
// @widgetbook.UseCase(
//   name: '',
//   type: ProjectAdministrator,
// )
// Widget ProjectAdministratorUseCase(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(color: Colors.white, child: const ProjectAdministrator()),
//     ],
//   );
// }
