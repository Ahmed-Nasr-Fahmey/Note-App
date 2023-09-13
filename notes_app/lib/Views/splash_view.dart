import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Views/notes_view.dart';
import 'package:notes_app/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = 'SplashScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        duration: 1200,
        splashIconSize: 250,
        splash: Image.asset(kLogo),
        nextScreen: const NotesView(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: kSecoundColor,
      ),
    );
  }
}
