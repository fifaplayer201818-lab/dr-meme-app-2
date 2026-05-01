import 'package:flutter/material.dart';
import '../models/content_models.dart';
import '../services/progress_service.dart';
import 'lesson_screen.dart';
import 'quiz_screen.dart';

class CourseScreen extends StatelessWidget {
  final Course course;
  const CourseScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: course.levels.length,
        itemBuilder: (context, levelIndex) {
          final level = course.levels[levelIndex];
          return Card(
            child: ExpansionTile(
              title: Text(level.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              children: [
                for (int i = 0; i < level.lessons.length; i++)
                  ListTile(
                    leading: Icon(progressService.isLessonUnlocked(i) ? Icons.play_arrow : Icons.lock),
                    title: Text(level.lessons[i].title),
                    onTap: progressService.isLessonUnlocked(i)
                        ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => LessonScreen(lesson: level.lessons[i])))
                        : null,
                  ),
                ListTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Final Level Exam'),
                  subtitle: const Text('Pass with 70% to unlock next level'),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(
                    title: '${level.title} Final Exam',
                    questions: level.finalExam,
                    onPassed: () => progressService.passLevel(level.id),
                  ))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
