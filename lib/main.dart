import 'package:flutter/material.dart';

void main() {
  runApp(const KamotionApp());
}

class KamotionApp extends StatelessWidget {
  const KamotionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kamotion Tracker',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const WorkoutTemplatesScreen(),
    );
  }
}

class WorkoutTemplatesScreen extends StatelessWidget {
  const WorkoutTemplatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Templates')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Push'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const WorkoutScreen(workoutName: 'Push'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Pull'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const WorkoutScreen(workoutName: 'Pull'),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Legs'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const WorkoutScreen(workoutName: 'Legs'),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  final String workoutName;

  const WorkoutScreen({super.key, required this.workoutName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(workoutName)),
      body: Center(
        child: Text(
          '$workoutName Workout',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
