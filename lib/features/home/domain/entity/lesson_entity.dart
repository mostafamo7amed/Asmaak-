class LessonEntity {
  final String id;
  final String title;
  final String coverImage;
  final String video;

  LessonEntity({required this.id, required this.title, required this.coverImage, required this.video,});

  toMap() => {'id': id, 'title': title, 'coverImage': coverImage, 'video': video,};

  factory LessonEntity.fromMap(Map<String, dynamic> map) => LessonEntity(id: map['id'], title: map['title'], coverImage: map['coverImage'], video: map['video'],);
}