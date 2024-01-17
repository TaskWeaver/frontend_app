import 'package:flutter/material.dart';
import 'package:front/app/domain/presentation/project/entity/task.dart';
import 'package:intl/intl.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

//바꿔야함
class TaskComponent extends StatelessWidget {
  const TaskComponent({
    Key? key,
    required this.task,
  }) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _TaskIconColumn(iconPath: task.iconPath),
          _buildTaskDetails(),
          const _AddTaskButton(),
        ],
      ),
    );
  }

  Expanded _buildTaskDetails() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ProgressBar(
                numOfSmallTask: task.numOfTotalTask!,
                numOfCompletedTask: task.numOfComplateTask!),
            const SizedBox(height: 5),
            _TaskInfo(taskTitle: task.taskTitle, endDate: task.dueDate),
            _Assigners(taskParticipants: task.participants),
          ],
        ),
      ),
    );
  }
}

class _TaskIconColumn extends StatelessWidget {
  const _TaskIconColumn({Key? key, required this.iconPath}) : super(key: key);
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Column(
        children: [
          Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Image.asset(
                iconPath,
              )),
            ),
          ),
          Expanded(
            child: Container(
              width: 5,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({
    Key? key,
    required this.numOfSmallTask,
    required this.numOfCompletedTask,
  }) : super(key: key);
  final int numOfSmallTask;
  final int numOfCompletedTask;

  @override
  Widget build(BuildContext context) {
    var widgetWidth = MediaQuery.of(context).size.width * 0.7;
    const paddingSize = 8.0;
    late double barWidth;
    if (numOfSmallTask > 4) {
      barWidth = (widgetWidth - numOfSmallTask * paddingSize) / numOfSmallTask;
    } else if (numOfSmallTask <= 4) {
      barWidth = (widgetWidth - 4 * paddingSize) / 4;
    }

    return Row(
      children: List.generate(numOfSmallTask, (index) {
        return Padding(
          padding: EdgeInsets.only(
              right: index < numOfSmallTask - 1 ? paddingSize : 0),
          child: _ProgressBarItem(
              completed: index < numOfCompletedTask, width: barWidth),
        );
      }),
    );
  }
}

class _ProgressBarItem extends StatelessWidget {
  const _ProgressBarItem({
    Key? key,
    required this.completed,
    required this.width,
  }) : super(key: key);
  final bool completed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: completed ? Colors.black : Colors.grey,
      width: width,
      height: 3,
    );
  }
}

class _TaskInfo extends StatelessWidget {
  const _TaskInfo({
    Key? key,
    required this.taskTitle,
    required this.endDate,
  }) : super(key: key);
  final String taskTitle;
  final DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7 - 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(taskTitle),
          Text(DateFormat('yyyy.MM.dd').format(endDate!)),
        ],
      ),
    );
  }
}

class _Assigners extends StatelessWidget {
  const _Assigners({Key? key, required this.taskParticipants})
      : super(key: key);
  final List<String> taskParticipants;
  @override
  Widget build(BuildContext context) {
    var taskParticipantsLength = taskParticipants.length;
    return Row(
      children: List.generate(taskParticipantsLength, (index) {
        return Transform.translate(
          offset: Offset(-10.0 * index, 0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              color: Colors.black,
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
            ),
          ),
        );
      }),
    );
  }
}

class _AddTaskButton extends StatelessWidget {
  const _AddTaskButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: const Center(child: Text('+')),
      ),
    );
  }
}

@widgetbook.UseCase(
  name: '',
  type: TaskComponent,
)
Widget TaskComponentUseCase(BuildContext context) {
  var temptask = Task(
    taskTitle: '1차 제안서 완성하기',
    taskContent: 'ㅇㅇㅇ 제안서 시안 완성',
    dueDate: DateTime.now(),
    participants: ['홍길동', '김철수', '이영희'],
    iconPath: 'assets/images/icon_check.png',
    numOfComplateTask: 4,
    numOfTotalTask: 4,
  );
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.white,
        child: TaskComponent(
          task: temptask,
        ),
      ),
    ],
  );
}
