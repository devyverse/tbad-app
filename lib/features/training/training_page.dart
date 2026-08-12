import 'package:flutter/material.dart';
import '../../widgets/primary_button.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Plan d’entraînement',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ici tu pourras définir tes séances : technique, physique, match, etc.',
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Créer une séance',
              icon: Icons.add,
              onPressed: () {
                Navigator.pushNamed(context, "/addSession");
              },
            ),
          ],
        ),
      ),
    );
  }
}
