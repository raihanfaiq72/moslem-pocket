import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';
import 'package:moslem_pocket/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Container(
             decoration: const BoxDecoration(
               gradient: LinearGradient(
                 begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                 colors: [AppColors.primary, AppColors.primaryDark],
               ),
             ),
           ),
           // Decorative background image placeholder
           Positioned.fill(
             child: Opacity(
               opacity: 0.1,
               child: Image.network(
                 "https://img.freepik.com/free-photo/open-quran-book_1409-3224.jpg",
                 fit: BoxFit.cover,
                 errorBuilder: (c, e, s) => Container(), // Fallback if offline
               ),
             ),
           ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),
                   const Text(
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 2),
                  const Text(
                    "Starting To Live\nWith The Al-Qur'an",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Rasulullah SAW Said: \"Whoever Reads One Letter From The Book Of Allah (The Koran), He Will Get One Goodness\".",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(flex: 1),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryDark,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.white30)
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Read Direct",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                   SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
