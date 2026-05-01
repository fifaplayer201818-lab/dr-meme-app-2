class ProgressService {
  final Set<String> passedLessons = {};
  final Set<String> passedLevels = {};

  bool isLessonUnlocked(int lessonIndex) {
    if (lessonIndex == 0) return true;
    return passedLessons.contains('lesson_$lessonIndex');
  }

  void passLesson(String lessonId) => passedLessons.add(lessonId);
  void passLevel(String levelId) => passedLevels.add(levelId);
}

final progressService = ProgressService();
