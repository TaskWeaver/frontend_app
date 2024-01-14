import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/team/componet/team_member_clips.dart';
import 'package:front/main/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                  )),
            ],
          ),
          const TeamMemberClips(teamMembersNumber: 4)
        ]),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: TeamTile
)
Widget loginScreenUseCase(BuildContext context) {
  return const WidgetBookContainer(child: TeamTile());
}
