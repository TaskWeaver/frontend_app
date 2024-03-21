class TeamEntity {
  TeamEntity({
    required this.id,
    required this.name,
    required this.inviteLink,
    required this.teamLeader,
    required this.createdAt,
  });
  final int id;
  final String name;
  final String inviteLink;
  final String teamLeader;
  final DateTime createdAt;
}
