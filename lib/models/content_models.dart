class Course {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<Level> levels;

  Course({required this.id, required this.title, required this.description, required this.imageUrl, required this.levels});
}

class Level {
  final String id;
  final String title;
  final List<Lesson> lessons;
  final List<Question> finalExam;

  Level({required this.id, required this.title, required this.lessons, required this.finalExam});
}

class Lesson {
  final String id;
  final String title;
  final String videoUrl;
  final String summaryPdfAsset;
  final List<Question> quiz;

  Lesson({required this.id, required this.title, required this.videoUrl, required this.summaryPdfAsset, required this.quiz});
}

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({required this.text, required this.options, required this.correctIndex});
}
