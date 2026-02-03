import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';
import 'package:moslem_pocket/modules/quran/models/surah.dart';
import 'package:moslem_pocket/modules/quran/screens/surah_detail_screen.dart';
import 'package:moslem_pocket/modules/qibla/screens/qibla_screen.dart';
import 'package:moslem_pocket/modules/dua_dzikir/screens/dua_dzikir_screen.dart';
import 'package:moslem_pocket/modules/tasbih/screens/tasbih_screen.dart';

class QuranDashboardScreen extends StatefulWidget {
  const QuranDashboardScreen({super.key});

  @override
  State<QuranDashboardScreen> createState() => _QuranDashboardScreenState();
}

class _QuranDashboardScreenState extends State<QuranDashboardScreen> {
  int _tabIndex = 0; // 0: Surah, 1: Juz, 2: Saved

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Teal Background for the top part
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Top Section (Header + Greeting + Card + Tabs)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header (Location & Icons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.location_on, color: Colors.white, size: 14),
                              SizedBox(width: 5),
                              Text(
                                "Jakarta Selatan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "7, Maret 2023",
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.history, color: Colors.white),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications_none, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Greeting
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Assalamualaikum Ukhti",
                            style: TextStyle(color: Colors.white70, fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Putri Zahra",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                         decoration: BoxDecoration(
                           color: Colors.white.withValues(alpha: 0.1),
                           borderRadius: BorderRadius.circular(12),
                         ),
                         child: IconButton(
                           icon: const Icon(Icons.search, color: Colors.white),
                           onPressed: () {},
                         ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Quick Access
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildQuickAccessItem(Icons.explore, "Qibla", () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const QiblaScreen()));
                      }),
                      _buildQuickAccessItem(Icons.volunteer_activism, "Dua", () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const DuaDzikirScreen()));
                      }),
                      _buildQuickAccessItem(Icons.fingerprint, "Tasbih", () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => const TasbihScreen()));
                      }),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Challenge Card
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.accent, // Yellow
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                         image: NetworkImage("https://img.freepik.com/free-vector/ramadan-kareem-banner-with-mosque-lanterns_1017-31252.jpg"), // Placeholder pattern
                         fit: BoxFit.cover,
                         opacity: 0.1,
                      )
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: const [
                                        Icon(Icons.calendar_today, size: 12, color: AppColors.black),
                                        SizedBox(width: 5),
                                        Text("Ramadhan with Qur'an", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.black)),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: const [
                                        Text("15", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.black)),
                                        SizedBox(width: 5),
                                        Text("Day", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.black)),
                                        SizedBox(width: 10),
                                        Icon(Icons.menu_book, size: 20, color: AppColors.black),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("You have reached surah Ali-'Imran  35%", style: TextStyle(fontSize: 10, color: AppColors.black)),
                                    const SizedBox(height: 5),
                                    LinearProgressIndicator(
                                      value: 0.35,
                                      backgroundColor: Colors.white,
                                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                                      minHeight: 4,
                                      borderRadius: BorderRadius.circular(2),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(), // Placeholder for illustration
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Tabs
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTabItem("Surah", 0),
                      _buildTabItem("Juz", 1),
                      _buildTabItem("Saved", 2),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            
            // Bottom Section (White Sheet)
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: _buildListContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isActive = _tabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? AppColors.accent : Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          if (isActive)
            Container(
              height: 3,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          else
             const SizedBox(height: 3),
        ],
      ),
    );
  }

  Widget _buildListContent() {
    switch (_tabIndex) {
      case 0:
        return _buildSurahList();
      case 1:
        return _buildJuzList();
      case 2:
        return _buildSavedList();
      default:
        return _buildSurahList();
    }
  }

  Widget _buildSurahList() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: dummySurahs.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final surah = dummySurahs[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: SizedBox(
            width: 40,
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Octogram simulation
                Transform.rotate(
                  angle: 0.785398, // 45 degrees
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary, width: 1.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                 Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary, width: 1.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                Text(
                  "${surah.number}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          title: Text("${surah.name} (${surah.numberOfAyahs})", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text(surah.englishName, style: const TextStyle(fontSize: 12, color: AppColors.grey)),
          trailing: Text(
            surah.name,
            style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Arial'),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SurahDetailScreen(surah: surah),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildJuzList() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: 5,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "${index + 1}",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
              ),
            ),
          ),
          title: Text("Juz ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text("Starting from Al-Fatihah", style: const TextStyle(fontSize: 12, color: AppColors.grey)),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grey),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildSavedList() {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: 2,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final surah = dummySurahs[index * 2];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: const Icon(Icons.bookmark, color: AppColors.primary, size: 30),
          title: Text(surah.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text("Verse 10", style: const TextStyle(fontSize: 12, color: AppColors.grey)),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {},
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildQuickAccessItem(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
