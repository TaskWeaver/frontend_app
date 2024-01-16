import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/project/shared/atom/dialog.dart';

class ProjectAdministrator extends StatelessWidget {
  const ProjectAdministrator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('프로젝트 담당자'),
        GestureDetector(
          onTap: () => _setAdministrator(context),
          child: _buildAdministratorRow(),
        ),
      ],
    );
  }

  Row _buildAdministratorRow() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: const Text('⭐'),
        ),
        const Text('김ㅇㅇ'),
      ],
    );
  }

  void _setAdministrator(BuildContext context) {
    context.dialog(child: _buildDialog(context));
  }

  Widget _buildDialog(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('프로젝트 담당자를 변경하시겠습니까?'),
          _buildAssignerComponent('김ㅇㅇ', context),
          _buildAssignerComponent('이ㅇㅇ', context),
          _buildAssignerComponent('최ㅇㅇ', context),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('닫기'),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildAssignerComponent(
      String assignerName, BuildContext context) {
    return GestureDetector(
      onTap: () => _showInformationDialog(assignerName, context),
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
            Text(assignerName),
          ],
        ),
      ),
    );
  }

  void _showInformationDialog(String assignerName, BuildContext context) {
    context.dialog(child: _buildInformationDialog(assignerName, context));
  }

  Widget _buildInformationDialog(String assignerName, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('프로젝트 담당자 $assignerName'),
          const Text('으로 변경하시겠습니까?'),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => _showConfirmationDialog(assignerName, context),
                child: const Text('확인'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
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
          onPressed: () => Navigator.pop(context),
          child: const Text('닫기'),
        ),
      ],
    );
  }
}
