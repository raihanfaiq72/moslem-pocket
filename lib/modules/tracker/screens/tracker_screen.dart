import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Teal Header Background
          Container(
            height: 180,
            color: AppColors.primary,
          ),
          
          SafeArea(
            child: Column(
              children: [
                // AppBar Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Center(
                    child: Text(
                      "My Progress",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

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
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Weekly Summary Card (Moved inside white sheet but styled to pop)
                          Container(
                            transform: Matrix4.translationValues(0, -40, 0), // Pull up to overlap
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF00695C), Color(0xFF004D40)], // Darker Teal
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.3),
                                  blurRadius: 15,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "Weekly Reading",
                                        style: TextStyle(color: Colors.white70, fontSize: 14),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "2 Hours 45 Mins",
                                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "You've recited 30% more than last week. Keep it up!",
                                        style: TextStyle(color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: CircularProgressIndicator(
                                        value: 0.3,
                                        backgroundColor: Colors.white24,
                                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
                                        strokeWidth: 6,
                                      ),
                                    ),
                                    const Text(
                                      "30%",
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          
                          // Correct the spacing because of the negative margin
                          const SizedBox(height: 0), 
                          
                          // Statistics Grid
                          const Text(
                            "Statistics",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(child: _buildStatCard("Total Khatam", "2", Icons.menu_book)),
                              const SizedBox(width: 15),
                              Expanded(child: _buildStatCard("Days Streak", "15", Icons.local_fire_department)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(child: _buildStatCard("Verses Read", "1,240", Icons.bookmark)),
                              const SizedBox(width: 15),
                              Expanded(child: _buildStatCard("Saved", "12", Icons.favorite)),
                            ],
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Recent Activity
                          const Text(
                            "Recent Activity",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
                          ),
                          const SizedBox(height: 15),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            separatorBuilder: (context, index) => const Divider(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.lightGrey,
                                  child: Icon(Icons.history, color: AppColors.primary),
                                ),
                                title: const Text("Surah Al-Mulk", style: TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: const Text("Just now • Verse 1-5"),
                                trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grey),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
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

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
