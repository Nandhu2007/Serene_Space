class QUser {
  final String name;
  final int score;

  QUser({
    required this.name,
    required this.score,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
    };
  }
  factory QUser.fromJson(dynamic json) {
    return QUser(
      name: json['name'] as String,
      score: json['score'] as int,
    );
  }
  @override
  String toString() {
    return 'User{name: $name, score: $score}';
  }
}