class CategoryProgress {
  final String lessonId;
  final bool isLearned;

  CategoryProgress({required this.lessonId, required this.isLearned});

  toMap() => {'lessonId': lessonId, 'isLearned': isLearned};

  factory CategoryProgress.fromMap(Map<String, dynamic> map) =>
      CategoryProgress(lessonId: map['lessonId'], isLearned: map['isLearned']);
}
