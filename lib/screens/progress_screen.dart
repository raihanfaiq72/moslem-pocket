import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "My Progress",
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weekly Summary Card
            Container(
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
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 5),
                    ),
                    child: Center(
                      child: Text(
                        "30%",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
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
                  title: Text("Surah Al-Mulk", style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Just now • Verse 1-5"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grey),
                );
              },
            ),
          ],
        ),
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
