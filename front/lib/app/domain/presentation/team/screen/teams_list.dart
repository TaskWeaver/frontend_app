import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/team/componet/team_tile.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        title: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              const Text(
                'TaskWeaver',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100)),
                  ))
            ])),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(bottom: 32.0, top: 16.0),
                child: Text(
                  'My Teams',
                  style: TextStyle(fontSize: 24),
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
                        child: TeamTile(),
                      );
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
