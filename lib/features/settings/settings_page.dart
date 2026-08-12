import 'package:flutter/material.dart';
import '../../app/theme_controller.dart';
import 'profile_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final controller = ThemeController.instance;

  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Réglages")),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: const Text("Thème clair"),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: controller.mode,
              onChanged: (v) => controller.setMode(v!),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text("Thème sombre"),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: controller.mode,
              onChanged: (v) => controller.setMode(v!),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_auto),
            title: const Text("Système"),
            trailing: Radio<ThemeMode>(
              value: ThemeMode.system,
              groupValue: controller.mode,
              onChanged: (v) => controller.setMode(v!),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profil joueur"),
            subtitle: const Text("Niveau, style, main dominante"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
