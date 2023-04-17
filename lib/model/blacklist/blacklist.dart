
class Blacklist{
  final int id;
  final int userId;
  final int blackedUserId;
  final DateTime createdAt;

  Blacklist({required this.id,required this.userId,required this.blackedUserId,required this.createdAt});
}

List<Blacklist> blacklists= [
  Blacklist(id: 1, userId: 1, blackedUserId: 4, createdAt: DateTime.now())
];