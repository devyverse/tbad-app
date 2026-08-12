import 'package:flutter/material.dart';
import '../../services/db_provider.dart';

class AddSessionPage extends StatefulWidget {
  const AddSessionPage({super.key});

  @override
  State<AddSessionPage> createState() => _AddSessionPageState();
}

class _AddSessionPageState extends State<AddSessionPage> {
  final durationController = TextEditingController();
  double intensity = 0.5;
  String type = "training";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Seance")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: durationController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Durée (minutes)",
              ),
            ),
            const SizedBox(height: 20),

            DropdownButton<String>(
              value: type,
              items: const [
                DropdownMenuItem(value: "training", child: Text("Training")),
                DropdownMenuItem(value: "match", child: Text("Match")),
                DropdownMenuItem(value: "technique", child: Text("Technique")),
                DropdownMenuItem(value: "technique", child: Text("Physique")),
              ],
              onChanged: (v) => setState(() => type = v!),
            ),

            const SizedBox(height: 20),

            Slider(
              value: intensity,
              min: 0,
              max: 1,
              divisions: 10,
              label: "${(intensity * 100).round()}%",
              onChanged: (v) => setState(() => intensity = v),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                final duration = int.tryParse(durationController.text) ?? 0;

                await appDatabase.sessionDao.insertSession(
                  date: DateTime.now(),
                  durationMinutes: duration,
                  intensity: intensity,
                  type: type,
                );

                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
