import 'package:flutter/material.dart';
import '../../services/db_provider.dart';

class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  List sessions = [];

  @override
  void initState() {
    super.initState();
    loadSessions();
  }

  Future<void> loadSessions() async {
    final data = await appDatabase.sessionDao.getAllSessions();
    setState(() => sessions = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes séances"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/addSession");
          loadSessions(); // refresh après ajout
        },
        child: const Icon(Icons.add),
      ),

      body: sessions.isEmpty
          ? const Center(child: Text("Aucune séance enregistrée"))
          : ListView.builder(
              itemCount: sessions.length,
              itemBuilder: (context, index) {
                final s = sessions[index];

                return ListTile(
                  title: Text("${s.type} - ${s.durationMinutes} min"),
                  subtitle: Text(
                    "${s.date.toLocal()} • Intensité ${(s.intensity * 100).round()}%",
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await appDatabase.sessionDao.deleteSession(s.id);
                      loadSessions();
                    },
                  ),
                );
              },
            ),
    );
  }
}
