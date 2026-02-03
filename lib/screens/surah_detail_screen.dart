import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';
import 'package:moslem_pocket/models/surah.dart';

class SurahDetailScreen extends StatelessWidget {
  final Surah surah;

  const SurahDetailScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Top part
      appBar: AppBar(
        title: Text(surah.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            // Header Card
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    surah.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    surah.translation,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const Divider(color: Colors.white24, height: 30),
                  Text(
                    "${surah.revelationType} • ${surah.numberOfAyahs} Verses",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                   const Text(
                    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Verses List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: surah.numberOfAyahs,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.primary,
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.share_outlined, color: AppColors.primary, size: 20),
                              const SizedBox(width: 10),
                              const Icon(Icons.play_arrow_outlined, color: AppColors.primary, size: 20),
                              const SizedBox(width: 10),
                              const Icon(Icons.bookmark_border, color: AppColors.primary, size: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "اللَّهُ لاَ إِلَهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ", // Dummy Verse text
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 2.0,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Allah! There is no god but He - the Living, The Self-subsisting, Eternal.",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
