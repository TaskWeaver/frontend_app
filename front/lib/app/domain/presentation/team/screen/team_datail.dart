import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/domain/presentation/team/componet/dialog.dart';
import 'package:front/app/domain/presentation/team/componet/selecting_sharing_method_dialog.dart';
import 'package:front/app/domain/presentation/team/state/projects_state.dart';
import 'package:front/app/domain/presentation/team/viewmodel/team_detail.dart';

class TeamDetailScreen extends ConsumerStatefulWidget {
  TeamDetailScreen({super.key});

  final elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(16.0),
    alignment: Alignment.centerLeft,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero)),
    backgroundColor: const Color(0xFFD9D9D9),
    foregroundColor: Colors.transparent,
  );

  @override
  ConsumerState<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends ConsumerState<TeamDetailScreen> {
  late TeamDetailViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = ref.read(teamDetailViewmodelProvider.notifier);
    viewmodel.getProjectsByTeamId('teamId');
  }

  @override
  Widget build(BuildContext context) {
    var projectsState = ref.watch(teamDetailViewmodelProvider);

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
            const Text(
              'TeamW2aver',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
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
                  '알림',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: extract these widgets and move to component
            Text(
              '팀이름 의 Board',
              style: textStyle.copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Team Member (팀원 수)',
                  style: textStyle.copyWith(fontSize: 15),
                ),
                TextButton(
                    onPressed: () =>
                        context.dialog(child: SelectingSharingMethodDailog()),
                    child: const Text('share'))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemExtent: 48,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: OvalBorder(),
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                child: Text(
                  'Team Project',
                  style: textStyle.copyWith(fontSize: 15),
                )),
            Expanded(
              child: ProjectList(
                  widget: widget,
                  textStyle: textStyle,
                  projectsState: projectsState),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({
    super.key,
    required this.widget,
    required this.textStyle,
    required this.projectsState,
  });

  final TeamDetailScreen widget;
  final TextStyle textStyle;
  final ProjectsState projectsState;

  @override
  Widget build(BuildContext context) {
    return projectsState.when(
        (data) {
          var projects = data.values;
          return CustomScrollView(
            slivers: <Widget>[
              SliverList.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: widget.elevatedButtonStyle,
                      child: Text(
                        projects[index].name,
                        style: textStyle.copyWith(fontSize: 15),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (message) {
          return Text(message ?? '');
        });
  }
}
