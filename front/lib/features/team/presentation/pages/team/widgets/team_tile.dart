import 'package:flutter/material.dart';
import 'package:front/features/team/presentation/pages/team/widgets/team_member_clips.dart';
import 'package:go_router/go_router.dart';

class TeamTile extends StatelessWidget {
  final int teamId;
  final String name;

  const TeamTile({
    required this.teamId,
    required this.name,
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
                Text(
                  '[$name]',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
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
