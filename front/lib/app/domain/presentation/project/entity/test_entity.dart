import 'package:front/app/domain/presentation/project/entity/project.dart';
import 'package:front/app/domain/presentation/project/entity/task.dart';
import 'package:front/resources/resources.dart';

var tempProject = Project(
  projectTitle: 'Project',
  projectContent: '이것은 임시 프로젝트입니다.',
  assignee: '홍길동',
  startDate: DateTime.now(),
  tasks: [
    Task(
      taskTitle: '제안서 1차 완성하기',
      taskContent: '~~~~~~~~~~~',
      dueDate: DateTime.now(),
      participants: ['홍길동', '김철수', '이영희'],
      iconPath: Images.iconCheck,
      numOfComplateTask: 4,
      numOfTotalTask: 4,
    ),
    Task(
      taskTitle: '제안서 2차 완성하기',
      taskContent: '~~~~~~~~~',
      dueDate: DateTime.now().add(const Duration(days: 1)),
      participants: ['홍길동'],
      iconPath: Images.iconPencil,
      numOfComplateTask: 1,
      numOfTotalTask: 3,
    ),
    Task(
      taskTitle: '제안서 3차 완성하기',
      taskContent: '~~~~~~~~~',
      dueDate: DateTime.now().add(const Duration(days: 1)),
      participants: ['김영희', '김두루미'],
      iconPath: Images.iconBook,
      numOfComplateTask: 0,
      numOfTotalTask: 2,
    ),
  ],
);
