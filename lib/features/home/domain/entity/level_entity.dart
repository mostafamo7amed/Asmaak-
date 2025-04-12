class LevelEntity {
  final String level;
  final int coins;
  final int diamonds;

  LevelEntity({required this.level, required this.coins, required this.diamonds});

  factory LevelEntity.fromJson(Map<String, dynamic> json) {
    return LevelEntity(
      level: json['level'],
      coins: json['coins'],
      diamonds: json['diamonds'],
    );
  }

  toJson() => {
    'level': level,
    'coins': coins,
    'diamonds': diamonds,
  };
}