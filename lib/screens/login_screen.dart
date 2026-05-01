import 'package:flutter/material.dart';
import '../services/device_limit_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool loading = false;

  Future<void> login() async {
    setState(() => loading = true);
    final allowed = await DeviceLimitService().isDeviceAllowed(email.text.trim());
    setState(() => loading = false);
    if (!mounted) return;
    if (allowed) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This account is already active on 2 devices.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Edu Stream', style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Educational streaming app starter', style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 32),
              TextField(controller: email, decoration: const InputDecoration(labelText: 'Email')),
              const SizedBox(height: 12),
              TextField(controller: password, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: loading ? null : login,
                child: Text(loading ? 'Checking...' : 'Login / Demo Enter'),
              ),
              const SizedBox(height: 16),
              const Text('Demo mode works without Firebase. Connect Firebase later for real users.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54)),
            ],
          ),
        ),
      ),
    );
  }
}
