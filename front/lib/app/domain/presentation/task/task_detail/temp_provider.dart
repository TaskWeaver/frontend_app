import 'package:flutter/widgets.dart';
import 'package:front/core/task/comment/comment_entity.dart';
import 'package:front/core/task/domain/entities/task_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'temp_provider.g.dart';

@riverpod
class SelectedTask extends _$SelectedTask {
  @override
  Future<TaskEntity> build() async {
    return TaskEntity(
        title: '제목',
        content: '내용',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        members: [1, 2, 3],
        color: const Color(0xFF000000),
        parentTaskId: null);
  }
}

@riverpod
class Comment extends _$Comment {
  @override
  List<CommentEntity> build() {
    return [
      CommentEntity(
        id: 1,
        authorName: '홍길동',
        content: '첫 번째 댓글입니다.',
        createdAt: DateTime.now(),
        parentId: null,
      ),
      CommentEntity(
        id: 2,
        authorName: '곽두팔',
        content: '두 번째 댓글입니다.',
        createdAt: DateTime.now(),
        parentId: 1,
      ),
      CommentEntity(
        id: 3,
        authorName: '김철수',
        content: '세 번째 댓글입니다.',
        createdAt: DateTime.now(),
        parentId: null,
      ),
      CommentEntity(
        id: 4,
        authorName: '임꺽정',
        content: '네 번째 댓글입니다.',
        createdAt: DateTime.now(),
        parentId: 1,
      )
      // 추가 댓글 및 답글 데이터...
    ];
  }
}
