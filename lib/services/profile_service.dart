import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';

class ProfileService {
  static final ProfileService instance = ProfileService._internal();
  ProfileService._internal();

  static const _key = "userProfile";

  UserProfile profile = UserProfile(
    level: PlayerLevel.intermediate,
    style: PlayerStyle.allRound,
    hand: DominantHand.right,
  );

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return;

    profile = UserProfile.fromJson(jsonDecode(raw));
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(profile.toJson()));
  }
}
