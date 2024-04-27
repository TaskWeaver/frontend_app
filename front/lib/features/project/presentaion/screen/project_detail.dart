import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front/features/project/presentaion/viewmodel/project_detail_viewmodel.dart';

class ProjectDetailScreen extends ConsumerStatefulWidget {
  const ProjectDetailScreen({super.key, required this.projectId});
  final String projectId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends ConsumerState<ProjectDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(projectDetailViewModelProvider.notifier)
        .loadProjectDetail(int.parse(widget.projectId)));
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(projectDetailViewModelProvider);
    return viewModel.when(
      data: (project) => Scaffold(
        appBar: AppBar(title: Text(project.name)),
        body: const _Body(),
        floatingActionButton: const _AddTaskButton(),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('An error occurred: $error'),
              ElevatedButton(
                onPressed: () => ref
                    .read(projectDetailViewModelProvider.notifier)
                    .loadProjectDetail(int.parse(widget.projectId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('Loading...')),
        body: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __BodyState();
}

class __BodyState extends ConsumerState<_Body> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          // 여기에 프로젝트 세부 정보 UI 구성 요소를 추가하세요.
          Text('Project Details will be displayed here'),
          // 예를 들어, 프로젝트 설명, 태스크 리스트 등을 추가할 수 있습니다.
        ],
      ),
    );
  }
}

class _AddTaskButton extends ConsumerWidget {
  const _AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      backgroundColor: Colors.grey[300],
      onPressed: () {
        // Todo: Task 추가 페이지 로직을 이곳에 구현합니다.
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Add Task'),
            content:
                Text('Task adding functionality will be implemented here.'),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
