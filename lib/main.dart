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

class WorkoutTemplatesScreen extends StatefulWidget {
  const WorkoutTemplatesScreen({super.key});

  @override
  State<WorkoutTemplatesScreen> createState() => _WorkoutTemplatesScreenState();
}

class _WorkoutTemplatesScreenState extends State<WorkoutTemplatesScreen> {
  final List<String> templates = ['Push', 'Pull', 'Legs'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout Templates')),
      body: ListView.builder(
        itemCount: templates.length,
        itemBuilder: (context, index) {
          final name = templates[index];

          return ListTile(
            title: Text(name),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutScreen(workoutName: name),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final controller = TextEditingController();

          final newName = await showDialog<String>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('New template'),
                content: TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'e.g. Upper, Pull (Volume), Full Body',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final value = controller.text.trim();
                      if (value.isEmpty) return;
                      Navigator.pop(context, value);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );

          if (newName == null) return;

          setState(() {
            templates.add(newName);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WorkoutScreen extends StatefulWidget {
  final String workoutName;

  const WorkoutScreen({super.key, required this.workoutName});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final List<String> exercises = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.workoutName)),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exerciseName = exercises[index];
          return ListTile(title: Text(exerciseName));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final controller = TextEditingController();

          final newExercise = await showDialog<String>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('New Exercise'),
                content: TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: const InputDecoration(
                    hintText: 'e.g. Bench Press',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final value = controller.text.trim();
                      if (value.isEmpty) return;
                      Navigator.pop(context, value);
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );

          if (newExercise == null) return;

          setState(() {
            exercises.add(newExercise);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
