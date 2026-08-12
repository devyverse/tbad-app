import 'package:flutter/material.dart';
import '../../models/user_profile.dart';
import '../../services/profile_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileService = ProfileService.instance;

  @override
  void initState() {
    super.initState();
    profileService.load().then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final profile = profileService.profile;

    return Scaffold(
      appBar: AppBar(title: const Text("Profil joueur")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Niveau", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButton<PlayerLevel>(
            value: profile.level,
            isExpanded: true,
            items: PlayerLevel.values.map((lvl) {
              return DropdownMenuItem(
                value: lvl,
                child: Text(_levelLabel(lvl)),
              );
            }).toList(),
            onChanged: (v) {
              if (v != null) {
                profile.level = v;
                profileService.save();
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 24),
          const Text("Style de jeu", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButton<PlayerStyle>(
            value: profile.style,
            isExpanded: true,
            items: PlayerStyle.values.map((st) {
              return DropdownMenuItem(
                value: st,
                child: Text(_styleLabel(st)),
              );
            }).toList(),
            onChanged: (v) {
              if (v != null) {
                profile.style = v;
                profileService.save();
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 24),
          const Text("Main dominante", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButton<DominantHand>(
            value: profile.hand,
            isExpanded: true,
            items: DominantHand.values.map((h) {
              return DropdownMenuItem(
                value: h,
                child: Text(_handLabel(h)),
              );
            }).toList(),
            onChanged: (v) {
              if (v != null) {
                profile.hand = v;
                profileService.save();
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }

  String _levelLabel(PlayerLevel lvl) {
    switch (lvl) {
      case PlayerLevel.beginner:
        return "Débutant";
      case PlayerLevel.intermediate:
        return "Intermédiaire";
      case PlayerLevel.advanced:
        return "Avancé";
    }
  }

  String _styleLabel(PlayerStyle st) {
    switch (st) {
      case PlayerStyle.offensive:
        return "Offensif";
      case PlayerStyle.defensive:
        return "Défensif";
      case PlayerStyle.allRound:
        return "Polyvalent";
    }
  }

  String _handLabel(DominantHand h) {
    switch (h) {
      case DominantHand.right:
        return "Droitier";
      case DominantHand.left:
        return "Gaucher";
    }
  }
}
