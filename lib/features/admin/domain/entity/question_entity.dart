class QuestionEntity {
  final String videoUrl;
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String correctAnswer;

  QuestionEntity(this.videoUrl, this.answer1, this.answer2,
      this.answer3, this.answer4, this.correctAnswer);

  toMap() => {
        'videoUrl': videoUrl,
        'answer1': answer1,
        'answer2': answer2,
        'answer3': answer3,
        'answer4': answer4,
        'correctAnswer': correctAnswer
      };
  factory QuestionEntity.fromMap(Map<String, dynamic> map) => QuestionEntity(
      map['videoUrl'],
      map['answer1'],
      map['answer2'],
      map['answer3'],
      map['answer4'],
      map['correctAnswer']);
}
