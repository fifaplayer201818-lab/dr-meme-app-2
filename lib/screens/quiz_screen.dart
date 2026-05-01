import 'package:flutter/material.dart';
import '../models/content_models.dart';

class QuizScreen extends StatefulWidget {
  final String title;
  final List<Question> questions;
  final VoidCallback onPassed;

  const QuizScreen({super.key, required this.title, required this.questions, required this.onPassed});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Map<int, int> answers = {};

  void submit() {
    int correct = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      if (answers[i] == widget.questions[i].correctIndex) correct++;
    }
    final score = widget.questions.isEmpty ? 0 : ((correct / widget.questions.length) * 100).round();
    final passed = score >= 70;
    if (passed) widget.onPassed();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(passed ? 'Passed' : 'Try Again'),
        content: Text('Your score is $score%. Passing score is 70%.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
          if (passed) TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('Continue')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (int i = 0; i < widget.questions.length; i++)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${i + 1}. ${widget.questions[i].text}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    for (int j = 0; j < widget.questions[i].options.length; j++)
                      RadioListTile<int>(
                        value: j,
                        groupValue: answers[i],
                        onChanged: (v) => setState(() => answers[i] = v ?? 0),
                        title: Text(widget.questions[i].options[j]),
                      ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 16),
          FilledButton(onPressed: submit, child: const Text('Submit')),
        ],
      ),
    );
  }
}
