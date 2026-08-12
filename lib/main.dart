import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.instance.load();

  runApp(const TrackerBadApp());
}


