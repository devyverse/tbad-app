import 'package:flutter/material.dart';
import 'theme.dart';
import 'theme_controller.dart';
import '../features/home/home_page.dart';
import '../features/sessions/add_session_page.dart';


class TrackerBadApp extends StatelessWidget {
  const TrackerBadApp({super.key});

@override
  Widget build(BuildContext context) {
    final controller = ThemeController.instance;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TrackerBadminton',
          theme: TrackerBadTheme.light,
          darkTheme: TrackerBadTheme.dark,
          themeMode: controller.mode,
          home: const HomePage(),
          routes: {"/addSession": (context) => AddSessionPage(),},
     );
    },
    );
  }
}
