class CommentEntity {
  CommentEntity({
    required this.id,
    required this.authorName,
    required this.content,
    required this.createdAt,
    this.parentId,
  });
  final int id;
  final String authorName;
  final String content;
  final DateTime createdAt;
  final int? parentId;
}
