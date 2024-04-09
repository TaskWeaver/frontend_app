import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/app/locator.dart';
import 'package:front/features/team/data/models/team_detail.dart';
import 'package:front/features/team/presentation/pages/team/widgets/dialog.dart';
import 'package:front/features/team/presentation/pages/team/widgets/selecting_sharing_method_dialog.dart';
import 'package:front/features/team/presentation/providers/projects_state.dart';
import 'package:front/features/team/presentation/providers/team_controller.dart';
import 'package:front/features/team/presentation/providers/team_detail.dart';
import 'package:front/features/team/presentation/providers/team_detail_controller.dart';
import 'package:front/features/user/presentation/viewmodel/main_screen_viewmodel.dart';

class TeamDetailView extends ConsumerStatefulWidget {
  final String teamId;

  TeamDetailView(this.teamId, {super.key});

  final elevatedButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(16.0),
    alignment: Alignment.centerLeft,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero)),
    backgroundColor: const Color(0xFFD9D9D9),
    foregroundColor: Colors.transparent,
  );

  @override
  ConsumerState<TeamDetailView> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends ConsumerState<TeamDetailView> {
  late TeamDetailViewmodel viewmodel;
  late TeamController teamController;
  final memberIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewmodel = ref.read(teamDetailViewmodelProvider.notifier);
    viewmodel.getProjectsByTeamId(1);
    ref
        .read(teamDetailControllerProvider.notifier)
        .getTeamById(int.parse(widget.teamId));
  }

  @override
  Widget build(BuildContext context) {
    var projectsState = ref.watch(teamDetailViewmodelProvider);
    final mainScreenViewModelState = ref.watch(mainScreenViewModelProvider);
    final teamState = ref.watch(teamDetailControllerProvider);
    int? memberId;
    String nickName = '';

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
            ),
          ],
        ),
      ),
      body: teamState.when(
            (teamDetailModel) {
          teamDetailModel as TeamDetailModel;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TODO: extract these widgets and move to component
                Text(
                  '${teamDetailModel.name} 의 Board',
                  style: textStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Team Member (${teamDetailModel.memberCount})',
                      style: textStyle.copyWith(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () =>
                          context.dialog(
                            child: SelectingSharingMethodDialog(
                              teamId: int.parse(widget.teamId),
                            ),
                          ),
                      child: const Text('share'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: teamDetailModel.memberCount,
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
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.dialog(
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 150,
                              child: TextField(
                                controller: memberIdController,
                                onChanged: (value) {
                                  memberId = int.parse(value);
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    if (memberId != null) {
                                      final result = await deleteMemberUseCase
                                          .call(
                                          teamId: int.parse(widget.teamId),
                                          memberId: [memberId!],
                                      );

                                      result.fold(
                                        onSuccess: (value) {
                                          ref.read(teamDetailControllerProvider.notifier).getTeamById(int.parse(widget.teamId));
                                          print('삭제가 완료 되습니다.');
                                          Navigator.pop(context);
                                        },
                                        onFailure: (e) {
                                          Text(e.toString());
                                          Navigator.pop(context);
                                        },
                                      );
                                    } else {
                                      print('memberId = null');
                                    }
                                  },
                                  child: const Text('삭제하기'),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('닫기'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const Text('팀원 삭제'),
                ),

                Expanded(
                  child: ProjectList(
                      widget: widget,
                      textStyle: textStyle,
                      projectsState: projectsState),
                ),
              ],
            ),
          );
        },
        loading: () =>
        const Center(
          child: CircularProgressIndicator(),
        ),
        error: (message) => Text(message ?? ''),
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

  final TeamDetailView widget;
  final TextStyle textStyle;
  final ProjectsState projectsState;

  @override
  Widget build(BuildContext context) {
    return projectsState.when(
          (projects) {
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
      loading: () =>
      const Center(
        child: CircularProgressIndicator(),
      ),
      error: (message) {
        return Text(message ?? '');
      },
    );
  }
}