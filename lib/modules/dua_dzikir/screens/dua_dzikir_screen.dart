import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class DuaDzikirScreen extends StatelessWidget {
  const DuaDzikirScreen({super.key});

  final List<Map<String, String>> dummyDuas = const [
    {
      "title": "Dua Before Eating",
      "arabic": "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
      "translation": "In the name of Allah, the Most Gracious, the Most Merciful.",
    },
    {
      "title": "Dua After Eating",
      "arabic": "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ",
      "translation": "All praise is due to Allah who has given us food and drink and made us Muslims.",
    },
    {
      "title": "Dua Before Sleeping",
      "arabic": "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
      "translation": "In Your name O Allah, I die and I live.",
    },
    {
      "title": "Dua When Waking Up",
      "arabic": "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      "translation": "All praise is due to Allah who has given us life after taking it away, and to Him is the resurrection.",
    },
    {
      "title": "Dua for Parents",
      "arabic": "رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ وَارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا",
      "translation": "My Lord! Forgive me and my parents, and have mercy on them as they raised me when I was small.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Teal Header
          Container(
            height: 150,
            color: AppColors.primary,
          ),
          
          SafeArea(
            child: Column(
              children: [
                // AppBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Dua & Dzikir",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Content
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(20),
                      itemCount: dummyDuas.length,
                      separatorBuilder: (context, index) => const Divider(height: 30),
                      itemBuilder: (context, index) {
                        final dua = dummyDuas[index];
                        return Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withValues(alpha: 0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                dua["title"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                dua["arabic"]!,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Arial', // Should use a proper Arabic font if available
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                dua["translation"]!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.grey,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.copy, size: 20, color: AppColors.grey),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.share, size: 20, color: AppColors.grey),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.favorite_border, size: 20, color: AppColors.grey),
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
