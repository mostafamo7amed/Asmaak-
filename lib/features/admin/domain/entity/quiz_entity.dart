import 'package:asmaak/features/admin/domain/entity/question_entity.dart';

class QuizEntity {
  final String? id;
  final QuestionEntity? question1;
  final QuestionEntity? question2;
  final QuestionEntity? question3;
  final QuestionEntity? question4;
  final int? points;
  final int? diamonds;

  QuizEntity({required this.id, required this.question1, required this.question2, required this.question3,
      required this.question4, required this.points, required this.diamonds});

  Map<String, dynamic> toMap() => {
        'id': id,
        'question1': question1?.toMap()??{},
        'question2': question2?.toMap()??{},
        'question3': question3?.toMap()??{},
        'question4': question4?.toMap()??{},
        'points': points,
        'diamonds': diamonds
      };

  factory QuizEntity.fromMap(Map<String, dynamic> map) => QuizEntity(
      id: map['id'],
      question1: QuestionEntity.fromMap(map['question1']),
      question2: QuestionEntity.fromMap(map['question2']),
      question3: QuestionEntity.fromMap(map['question3']),
      question4: QuestionEntity.fromMap(map['question4']),
      points: map['points'],
      diamonds: map['diamonds']);
}
