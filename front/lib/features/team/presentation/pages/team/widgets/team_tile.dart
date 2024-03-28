import 'package:flutter/material.dart';
import 'package:front/features/team/presentation/pages/team/widgets/team_member_clips.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class TeamTile extends StatelessWidget {
  final int teamId;

  const TeamTile({
    required this.teamId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListTile(
        onTap: () => context.push('/teamDetail/$teamId'),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  '[ 팀 이름 ]',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '팀장',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const TeamMemberClips(teamMembersNumber: 4),
          ],
        ),
      ),
    );
  }
}

// @widgetbook.UseCase(name: '', type: TeamTile)
// Widget loginScreenUseCase(BuildContext context) {
//   return const WidgetBookContainer(child: TeamTile());
// }
