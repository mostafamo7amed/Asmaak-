class QuizHistoryEntity {
  String? id;
  String? score;
  String? result;

  QuizHistoryEntity({this.id, this.score, this.result});

  Map<String, dynamic> toMap() => {'id': id, 'score': score, 'result': result};

  factory QuizHistoryEntity.fromMap(Map<String, dynamic> map) =>
      QuizHistoryEntity(
          id: map['id'], score: map['score'], result: map['result']);
}
