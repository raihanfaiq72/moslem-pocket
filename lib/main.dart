import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_theme.dart';
import 'package:moslem_pocket/screens/splash_screen.dart';

void main() {
  runApp(const MoslemPocketApp());
}

class MoslemPocketApp extends StatelessWidget {
  const MoslemPocketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moslem Pocket',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme.copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
