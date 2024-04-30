import 'package:flutter/material.dart';
import 'package:front/features/team/data/models/team_model.dart';
import 'package:front/features/team/viewmodel/board_view_model.dart';
import 'package:front/shared/theme/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeamHome extends ConsumerStatefulWidget {
  const TeamHome({super.key});

  @override
  ConsumerState<TeamHome> createState() => _TeamHomeState();
}

class _TeamHomeState extends ConsumerState<TeamHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Text('보드'),
              ),
              Tab(icon: Text('투두')),
              Tab(icon: Text('마이')),
            ],
          ),
          title: const Text('TaskWaver'),
        ),
        body: const TabBarView(
          children: [
            _Board(),
            Text('투두'),
            Text('마이'),
          ],
        ),
      ),
    );
  }
}

class _Board extends ConsumerStatefulWidget {
  const _Board({super.key});

  @override
  ConsumerState<_Board> createState() => __BoardState();
}

class __BoardState extends ConsumerState<_Board> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(boardViewModelProvider.notifier).getTeams(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final boardViewModel = ref.watch(boardViewModelProvider);

    return boardViewModel.when(
      data: (teamList) => Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 팀 리스트를 보여주는 위젯
              ...teamList.map((team) => _BoardItem(team: team)).toList(),
              // 추가 버튼 등 다른 UI 요소
              const _AddBoardItemButton()
            ],
          ),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
    // 최초에만 future를 설정
  }
}

class _AddBoardItemButton extends StatelessWidget {
  const _AddBoardItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.grey[200],
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          context.go('/team/create');
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.add,
                  size: 32,
                ),
                Text(
                  '팀 생성하기',
                  style: themeData.textTheme.labelLarge,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BoardItem extends StatelessWidget {
  const _BoardItem({super.key, required this.team});
  final TeamModel team;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Theme.of(context).primaryColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          context.go('/team/${team.id}');
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                child: Text(team.name,
                    style: themeData.textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(team.description ?? '',
                    style: themeData.textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    )),
              ),
              const Divider(
                color: Colors.white,
              ),
              Row(
                children: [
                  if (team.myRole == 'LEADER')
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('리더',
                            style: themeData.textTheme.labelLarge!.copyWith(
                              color: Colors.black,
                            )),
                      ),
                    ),
                  if (team.myRole == 'MEMBER')
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('멤버',
                            style: themeData.textTheme.labelLarge!.copyWith(
                              color: Colors.black,
                            )),
                      ),
                    ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                    child: Row(
                      children: team.members
                          .map(
                            (member) => const CircleAvatar(
                              //Todo :  만약 이미지가 없을 경우 기본 이미지로 변경
                              //backgroundImage: NetworkImage(member.imageUrl),
                              backgroundColor: Colors.white,
                              radius: 20,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
