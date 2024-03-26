import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/team/componet/team_tile.dart';
import 'package:front/i18n/strings.g.dart';
import 'package:go_router/go_router.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class TeamsListScreen extends StatefulWidget {
  const TeamsListScreen({super.key});

  @override
  State<TeamsListScreen> createState() => _TeamsListScreenState();
}

class _TeamsListScreenState extends State<TeamsListScreen> {
  @override
  Widget build(BuildContext context) {
    var t = Translations.of(context).teamsListScreen;
    var textStyle = const TextStyle(
      color: Colors.black,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.appbar.appBarTitle,
              style: textStyle.copyWith(fontSize: 12),
            ),
            Column(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: OvalBorder(),
                  ),
                ),
                Text(
                  t.appbar.notification,
                  textAlign: TextAlign.center,
                  style: textStyle.copyWith(fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32.0, top: 16.0),
                child: Text(
                  t.screen.teamBoardTitle(teamName: '[팀이름]'),
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 0),
                          child: TeamTile(
                            teamMemberType: TeamMemberType.leader,
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          context.push('/teamCreate');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: TeamsListScreen,
)
Widget loginScreenUseCase(BuildContext context) {
  return const TeamsListScreen();
}
