import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/team/data/models/create_team_request_model.dart';
import 'package:front/features/team/viewmodel/team_create_view_model.dart';
import 'package:front/shared/theme/theme.dart';
import 'package:go_router/go_router.dart';

class TeamCreatePage extends ConsumerStatefulWidget {
  const TeamCreatePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamCreatePageState();
}

class _TeamCreatePageState extends ConsumerState<TeamCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _teamNameController = TextEditingController();
  final _teamDescriptionController = TextEditingController();

  @override
  void dispose() {
    _teamNameController.dispose();
    _teamDescriptionController.dispose();
    super.dispose();
  }

  void createTeam() {
    if (_formKey.currentState!.validate()) {
      final createTeamRequest = CreateTeamRequest(
        name: _teamNameController.text,
        description: _teamDescriptionController.text,
      );
      ref
          .read(teamCreateViewModelProvider.notifier)
          .createTeam(createTeamRequest: createTeamRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(teamCreateViewModelProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('팀 생성하기')),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('팀 이름', style: themeData.textTheme.labelLarge),
                TextFormField(
                  controller: _teamNameController,
                  validator: (value) =>
                      value == null || value.isEmpty ? '팀 이름을 입력해주세요' : null,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '팀 이름을 입력해주세요',
                  ),
                ),
                const SizedBox(height: 16),
                Text('팀 소개', style: themeData.textTheme.labelLarge),
                TextFormField(
                  controller: _teamDescriptionController,
                  validator: (value) =>
                      value == null || value.isEmpty ? '팀 소개를 입력해주세요' : null,
                  decoration: const InputDecoration(
                    hintText: '팀 소개를 입력해주세요',
                  ),
                ),
                const Spacer(),
                viewModel.maybeWhen(
                    data: (value) {
                      // 만약 팀 생성이 완료되었을 때 보여주는 dialog
                      if (value != null) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('팀 생성 완료'),
                                content: Text('팀이 생성되었습니다. ${value.name}'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      context.go('/team');
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                        });
                        return ElevatedButton(
                          onPressed: () {},
                          child: const SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('생성'))),
                        );
                      } else {
                        // 처음 화면 시작시 보여주는 버튼
                        return ElevatedButton(
                          onPressed: createTeam,
                          child: const SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('생성'))),
                        );
                      }
                    },

                    //로딩시 보여주는 버튼
                    loading: () => Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const SizedBox(
                              width: double.infinity,
                              child: Center(
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                    //에러시 보여주는 버튼
                    orElse: () => ElevatedButton(
                          onPressed: createTeam,
                          child: const SizedBox(
                              width: double.infinity,
                              child: Center(child: Text('생성'))),
                        )),
              ],
            ),
          ),
        ));
  }
}
