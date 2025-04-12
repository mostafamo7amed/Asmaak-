import '../../features/home/domain/entity/category_progress.dart';

bool isLessonLearned(lessonId, List<CategoryProgress> categoryProgress) {
  if (categoryProgress.isEmpty) {
    return false;
  }
  return categoryProgress.any((element) => element.lessonId == lessonId);
}
