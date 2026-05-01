import 'package:flutter/material.dart';
import '../services/demo_content.dart';
import '../services/subscription_service.dart';
import 'course_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = DemoContent.courses;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edu Stream'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(subscriptionService.isActive ? 'Active' : 'Expired')),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Continue Learning', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          for (final course in courses)
            Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(course.description),
                trailing: const Icon(Icons.play_circle_fill),
                onTap: () {
                  if (!subscriptionService.isActive) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Subscription expired. Contact admin to renew.')));
                    return;
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (_) => CourseScreen(course: course)));
                },
              ),
            ),
        ],
      ),
    );
  }
}
