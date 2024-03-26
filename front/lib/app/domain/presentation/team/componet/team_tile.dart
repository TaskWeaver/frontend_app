import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/team/componet/team_member_clips.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:front/main/widgetbook.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum TeamMemberType {
  member,
  leader,
}

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
    required this.teamMemberType,
  });

  final TeamMemberType teamMemberType;

  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context).teamTile;
    return Container(
      color: Colors.grey[300],
      child: ListTile(
        onTap: () => context.push('/teamDetail'),
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Text(
                t.teamName,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      teamMemberType == TeamMemberType.leader
                          ? t.teamMemberType.teamLeader
                          : t.teamMemberType.teamMember,
                      style: const TextStyle(fontSize: 12),
                    ),
                  )),
            ],
          ),
          const TeamMemberClips(teamMembersNumber: 4)
        ]),
      ),
    );
  }
}

@widgetbook.UseCase(name: '', type: TeamTile)
Widget loginScreenUseCase(BuildContext context) {
  return const WidgetBookContainer(
      child: TeamTile(
    teamMemberType: TeamMemberType.leader,
  ));
}
