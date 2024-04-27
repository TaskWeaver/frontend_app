import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/features/project/data/models/create_project_request.dart';
import 'package:front/features/project/data/models/project_model.dart';
import 'package:front/features/project/presentaion/viewmodel/project_creation_viewmodel.dart';
import 'package:front/features/project/presentaion/viewmodel/team_members_provider.dart';
import 'package:front/features/team/data/models/team_detail_member_model.dart';
import 'package:front/features/team/viewmodel/selected_team_project_list_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectCreationScreen extends HookConsumerWidget {
  const ProjectCreationScreen({super.key, required this.teamId});
  final String teamId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(teamId);
    final titlefocusNode = FocusNode();
    final descriptionfocusNode = FocusNode();

    final formKey = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final members = useState<List<TeamDetailMemberModel>>([]);
    final projectManager = useState<TeamDetailMemberModel?>(null);
    void updateProjectManager(TeamDetailMemberModel? manager) {
      projectManager.value = manager;
    }

    void addMember(TeamDetailMemberModel member) {
      members.value = [...members.value, member];
    }

    void removeMember(TeamDetailMemberModel member) {
      members.value = members.value.where((m) => m.id != member.id).toList();
    }

    void createProject() {
      if (formKey.currentState!.validate() && projectManager.value != null) {
        //memberIdList에는 담당자도 포함되어야 함
        var projectRequest = CreateProjectRequest(
          name: nameController.text,
          description: descriptionController.text,
          managerId: projectManager.value!.id,
          memberIdList: [
            projectManager.value!.id,
            ...members.value.map((member) => member.id).toList(),
          ],
        );

        ref
            .read(projectCreationViewModelProvider.notifier)
            .createProject(projectRequest, int.parse(teamId));

        print('API Request Data: ${projectRequest.toJson()}');
      }
    }

    ref.listen<AsyncValue<ProjectModel?>>(
      projectCreationViewModelProvider,
      (_, state) {
        state.when(
          data: (project) {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('Project Created Successfully'),
                content: Text('Project ID: ${project?.name ?? "Unknown"}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      ref.invalidate(
                          selectedTeamProjectListProvider(int.parse(teamId)));
                      Navigator.pop(context);
                      Navigator.pop(context);
                      context.go('/team/$teamId');
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          loading: () => showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              content: CircularProgressIndicator(),
              title: Text('Creating Project...'),
            ),
          ),
          error: (error, _) => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Error'),
              content: Text('Error: $error'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ElevatedButton(
          onPressed: createProject,
          child: const Text('Create Project'),
        ),
      ),
      appBar: AppBar(title: const Text('Create Project')),
      body: Form(
        key: formKey,
        child: GestureDetector(
          onTap: () {
            titlefocusNode.unfocus();
            descriptionfocusNode.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('프로젝트 담당자',
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 8),
                  if (projectManager.value != null) ...[
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person),
                        ),
                        const SizedBox(width: 8),
                        Text(projectManager.value!
                            .nickname), // Assuming '프로젝트 담당자 이름' is a placeholder for actual manager's name.
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            projectManager.value = null;
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ] else ...[
                    Row(
                      children: [
                        const Text(
                          '프로젝트 담당자를 선택해주세요',
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // show dialog to select project manager
                            showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                      child: _ProjectManager(
                                          selectedLeader: projectManager.value,
                                          selectedTeamMember: members.value,
                                          teamId: int.parse(teamId),
                                          updateProjectManager:
                                              updateProjectManager),
                                    ));
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                  const SizedBox(height: 24),
                  Text('프로젝트 제목',
                      style: Theme.of(context).textTheme.labelMedium),
                  TextFormField(
                    focusNode: titlefocusNode,
                    controller: nameController,
                    decoration:
                        const InputDecoration(hintText: '프로젝트 제목을 입력해주세요'),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter project name'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  Text('맴버', style: Theme.of(context).textTheme.labelMedium),
                  Row(
                    children: [
                      const Text('프로젝트 맴버를 선택해주세요'),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                    child: _ProjectMember(
                                        selectedLeader: projectManager.value,
                                        teamId: int.parse(teamId),
                                        removeMember: removeMember,
                                        addMember: addMember,
                                        selectedMembers: members.value),
                                  ));
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  Wrap(
                    children: members.value
                        .map((member) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Chip(
                                label: Text(member.nickname),
                                onDeleted: () {
                                  removeMember(member);
                                },
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  Text('프로젝트 설명',
                      style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 8),
                  TextFormField(
                    focusNode: descriptionfocusNode,
                    controller: descriptionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: '맴버를 추가해주세요',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          Colors.grey[100], // Adds a fill color to the field
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Please enter a description'
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProjectManager extends HookConsumerWidget {
  const _ProjectManager({
    Key? key,
    required this.teamId,
    required this.updateProjectManager,
    required this.selectedTeamMember,
    required this.selectedLeader,
  }) : super(key: key);

  final int teamId;
  final void Function(TeamDetailMemberModel?) updateProjectManager;
  final List<TeamDetailMemberModel> selectedTeamMember;
  final TeamDetailMemberModel? selectedLeader;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localSelectedTeamMemberUseState =
        useState<List<TeamDetailMemberModel>>(selectedTeamMember);
    final localSelectedLeaderUseState =
        useState<TeamDetailMemberModel?>(selectedLeader);
    final teamMembers = ref.watch(teamMembersProvider(teamId));
    //todo : 중복된 맴버 선택 가능하게 만들고
    //todo : 리더인데 맴버로 선택시 불가능하게 처리
    //todo : 선택된 맴버는 표시
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Project Manager'),
          teamMembers.when(
            data: (teamMembers) => ListView.builder(
              shrinkWrap: true,
              itemCount: teamMembers.length,
              itemBuilder: (context, index) {
                //이미 선택된 맴버 : 선택된 맴버 표시, 리더로 선택 불가능, 만약 누를시 맴버는 리더로 선택 불가능하다고 다이어로그 나타나기
                //선택되지 않은 맴버 : 아무것도 표시하지 않음, 리더로 선택 가능, 만약 누를시 리더로 변경
                //선택된 리더 : 선택된 리더 표시, 만약 누를시 리더 변경없으므로 다이어로그만 닫기

                final member = teamMembers[index];
                final isSelectedMember = localSelectedTeamMemberUseState.value
                    .any((m) => m.id == member.id);
                final isLeader =
                    localSelectedLeaderUseState.value?.id == member.id;
                if (isSelectedMember) {
                  return ListTile(
                      leading: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person),
                      ),
                      title: Text(member.nickname),
                      trailing: const Text('맴버'),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text('리더는 맴버로 선택할 수 없습니다.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      });
                } else if (isLeader) {
                  return ListTile(
                      leading: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person),
                      ),
                      title: Text(member.nickname),
                      trailing: const Text('리더'),
                      onTap: () {
                        Navigator.pop(context);
                      });
                } else {
                  return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: isLeader
                            ? Theme.of(context).primaryColor
                            : Colors.grey,
                        child: const Icon(Icons.person),
                      ),
                      title: Text(member.nickname),
                      onTap: () {
                        updateProjectManager(member);
                        Navigator.pop(context);
                      });
                }
              },
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, _) => Text('Error: $error'),
          ),
        ],
      ),
    );
  }
}

class _ProjectMember extends HookConsumerWidget {
  const _ProjectMember({
    Key? key,
    required this.teamId,
    required this.addMember,
    required this.removeMember,
    required this.selectedMembers,
    required this.selectedLeader,
  }) : super(key: key);
  final int teamId;
  final TeamDetailMemberModel? selectedLeader;
  final void Function(TeamDetailMemberModel) addMember;
  final void Function(TeamDetailMemberModel) removeMember;
  final List<TeamDetailMemberModel> selectedMembers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamMembers = ref.watch(teamMembersProvider(teamId));

    final localSelectedMembers =
        useState<List<TeamDetailMemberModel>>(selectedMembers);
    final localSelectedLeader =
        useState<TeamDetailMemberModel?>(selectedLeader);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Project Member'),
            Expanded(
              child: teamMembers.when(
                data: (teamMembers) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: teamMembers.length,
                  itemBuilder: (context, index) {
                    final member = teamMembers[index];
                    final isSelected = localSelectedMembers.value
                        .any((m) => m.id == member.id);
                    final isLeader = localSelectedLeader.value?.id == member.id;
                    if (isSelected) {
                      return ListTile(
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person),
                          ),
                          title: Text(member.nickname),
                          trailing: const Text('맴버'),
                          onTap: () {
                            removeMember(member);
                            localSelectedMembers.value = localSelectedMembers
                                .value
                                .where((m) => m.id != member.id)
                                .toList();
                          });
                    } else if (isLeader) {
                      return ListTile(
                          leading: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person),
                          ),
                          title: Text(member.nickname),
                          trailing: const Text('리더'),
                          onTap: () {
                            //show dialog
                            //리더는 맴버로 선택할 수 없습니다.
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text('Error'),
                                content: const Text('리더는 맴버로 선택할 수 없습니다.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('닫기'),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            child: const Icon(Icons.person),
                          ),
                          title: Text(member.nickname),
                          onTap: () {
                            addMember(member);
                            localSelectedMembers.value = [
                              ...localSelectedMembers.value,
                              member
                            ];
                          });
                    }

                    // return ListTile(
                    //   leading: CircleAvatar(
                    //     radius: 20,
                    //     backgroundColor: isSelected
                    //         ? Theme.of(context).primaryColor
                    //         : Colors.grey,
                    //     child: const Icon(Icons.person),
                    //   ),
                    //   title: Text(member.nickname),
                    //   trailing: isSelected ? const Icon(Icons.check) : null,
                    //   onTap: () {
                    //     if (isSelected) {
                    //       localSelectedMembers.value = localSelectedMembers
                    //           .value
                    //           .where((m) => m.id != member.id)
                    //           .toList();
                    //       removeMember(member);
                    //     } else {
                    //       localSelectedMembers.value = [
                    //         ...localSelectedMembers.value,
                    //         member
                    //       ];
                    //       addMember(member);
                    //     }
                    //   },
                    // );
                  },
                ),
                loading: () => const CircularProgressIndicator(),
                error: (error, _) => Text('Error: $error'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
