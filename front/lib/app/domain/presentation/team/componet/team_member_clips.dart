import 'package:flutter/material.dart';
import 'package:front/main/widgetbook.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class TeamMemberClips extends StatelessWidget {
  const TeamMemberClips({super.key, required this.teamMembersNumber});

  final int teamMembersNumber;

  List<Widget> teamMemberClips(int N) {
    var arr = <Widget>[];
    var radius = 16;
    for (var i = 0; i < N; i++) {
      arr.add(Padding(
        padding: EdgeInsets.only(left: radius * 10 / 8 * i),
        child: Container(
          height: radius * 2,
          width: radius * 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1),
              color: const Color.fromARGB(0, 0, 0, 0)),
        ),
      ));
    }
    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: teamMemberClips(teamMembersNumber),
    );
  }
}

@widgetbook.UseCase(name: '', type: TeamMemberClips)
Widget loginScreenUseCase(BuildContext context) {
  return WidgetBookContainer(
      child: TeamMemberClips(
          teamMembersNumber: context.knobs.int
              .slider(label: 'number of members', initialValue: 4)));
}
