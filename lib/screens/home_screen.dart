import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';
import 'package:moslem_pocket/models/surah.dart';
import 'package:moslem_pocket/screens/surah_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tabIndex = 0; // 0: Surah, 1: Juz, 2: Saved

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.location_on, color: AppColors.grey, size: 16),
            SizedBox(width: 5),
            Text(
              "Jakarta Selatan",
              style: TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.grey),
            onPressed: () {
               ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No new notifications")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.grey),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search feature coming soon!")),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Assalamualaikum Ukhti",
              style: TextStyle(color: AppColors.grey, fontSize: 14),
            ),
            const SizedBox(height: 5),
            const Text(
              "Putri Zahra",
              style: TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Challenge Card
            InkWell(
              onTap: () {
                 // Maybe go to detail challenge
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.accent, Color(0xFFFFE082)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    // Decorative circles
                    Positioned(
                      right: -20,
                      bottom: -20,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.calendar_today, size: 14, color: Colors.white),
                              SizedBox(width: 5),
                              Text("Ramadhan with Qur'an", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.black)),
                            ],
                          ),
                          const Spacer(),
                          const Text("Challenge", style: TextStyle(fontSize: 12, color: AppColors.black)),
                           const Text("15 Day", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black)),
                          const SizedBox(height: 5),
                          const Text("You have reached surah Ali-'Imran  35%", style: TextStyle(fontSize: 10, color: AppColors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            // Tabs
            Row(
              children: [
                _buildTabItem("Surah", 0),
                _buildTabItem("Juz", 1),
                _buildTabItem("Saved", 2),
              ],
            ),
            const SizedBox(height: 15),
            // List Content
            _buildListContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    bool isActive = _tabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _tabIndex = index;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: isActive ? AppColors.primary : AppColors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              )
            else
               Container(
                margin: const EdgeInsets.only(top: 8),
                height: 3,
                width: 40,
                color: Colors.transparent,
              )
          ],
        ),
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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                 const Icon(Icons.star_border, color: AppColors.primary, size: 36),
                Text(
                  "${surah.number}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          ),
          title: Text(surah.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Row(
            children: [
              Text(surah.revelationType.toUpperCase(), style: const TextStyle(fontSize: 12, color: AppColors.grey)),
              const SizedBox(width: 5),
              const CircleAvatar(radius: 2, backgroundColor: AppColors.grey),
              const SizedBox(width: 5),
              Text("${surah.numberOfAyahs} Verses", style: const TextStyle(fontSize: 12, color: AppColors.grey)),
            ],
          ),
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
    // Dummy Juz List
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5, // Show first 5 Juz for demo
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
          onTap: () {
             ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Reading Juz ${index + 1}")),
              );
          },
        );
      },
    );
  }

  Widget _buildSavedList() {
    // Dummy Saved List
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final surah = dummySurahs[index * 2]; // Just pick some surahs
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          leading: const Icon(Icons.bookmark, color: AppColors.primary, size: 30),
          title: Text(surah.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          subtitle: Text("Verse 10", style: const TextStyle(fontSize: 12, color: AppColors.grey)),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
               ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Removed from saved")),
              );
            },
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
}
