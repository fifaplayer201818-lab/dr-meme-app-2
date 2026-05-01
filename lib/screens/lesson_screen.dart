import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/content_models.dart';
import '../services/progress_service.dart';
import 'pdf_screen.dart';
import 'quiz_screen.dart';

class LessonScreen extends StatefulWidget {
  final Lesson lesson;
  const LessonScreen({super.key, required this.lesson});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final id = YoutubePlayer.convertUrlToId(widget.lesson.videoUrl) ?? '';
    controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.lesson.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: YoutubePlayer(controller: controller),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.picture_as_pdf),
            label: const Text('Open Summary PDF'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PdfScreen(assetPath: widget.lesson.summaryPdfAsset))),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            icon: const Icon(Icons.quiz),
            label: const Text('Start Lesson Quiz'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(
              title: '${widget.lesson.title} Quiz',
              questions: widget.lesson.quiz,
              onPassed: () => progressService.passLesson(widget.lesson.id),
            ))),
          ),
          const SizedBox(height: 16),
          const Text('Rule: pass the quiz with 70% or more to unlock the next episode.', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
