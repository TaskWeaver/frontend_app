import 'package:flutter/material.dart';
import 'package:front/features/user/data/models/user.dart';
import 'package:front/features/team/presentation/pages/team/widgets/dialog.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('프로젝트 담당자'),
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
        Text(administrator.nickName ?? ''),
      ],
    );
  }

  void _setAdministrator(BuildContext context, List<UserModel> teamMembers) {
    context.dialog(child: _buildDialog(context, teamMembers));
  }

  Widget _buildDialog(BuildContext context, List<UserModel> teamMembers) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('프로젝트 담당자를 변경하시겠습니까?'),
          ..._buildAssignerComponets(context, teamMembers),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('닫기'),
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
            Text(user.nickName ?? ''),
          ],
        ),
      ),
    );
  }

  void _showInformationDialog(UserModel user, BuildContext context) {
    context.dialog(child: _buildInformationDialog(user, context));
  }

  Widget _buildInformationDialog(UserModel user, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('프로젝트 담당자 ${user.nickName}'),
          const Text('으로 변경하시겠습니까?'),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onChanged(user);
                  _showConfirmationDialog(user.nickName ?? '', context);
                },
                child: const Text('확인'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('취소'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(String assignerName, BuildContext context) {
    context.dialog(child: _buildConfirmationDialog(assignerName, context));
  }

  Widget _buildConfirmationDialog(String assignerName, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('프로젝트 담당자 $assignerName'),
        const Text('으로 변경되었습니다.'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text('닫기'),
        ),
      ],
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
