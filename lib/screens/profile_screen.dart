import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            Center(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightGrey,
                          image: const DecorationImage(
                            image: NetworkImage("https://i.pravatar.cc/300"), // Dummy avatar
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit, color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Putri Zahra",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  const Text(
                    "putrizahra@example.com",
                    style: TextStyle(fontSize: 14, color: AppColors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Premium Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.accent, Color(0xFFFFE082)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.star, color: Colors.white, size: 40),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Upgrade to Premium",
                          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "Unlock all features and remove ads",
                          style: TextStyle(color: AppColors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: AppColors.black, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Menu Items
            _buildMenuItem("General Settings", Icons.settings),
            _buildMenuItem("Account Security", Icons.security),
            _buildMenuItem("Notifications", Icons.notifications),
            _buildMenuItem("Language", Icons.language, trailingText: "English"),
            _buildMenuItem("Help & Support", Icons.help_outline),
            _buildMenuItem("Log Out", Icons.logout, isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, {String? trailingText, bool isDestructive = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isDestructive ? Colors.red.withValues(alpha: 0.1) : AppColors.lightGrey,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: isDestructive ? Colors.red : AppColors.primary, size: 20),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDestructive ? Colors.red : AppColors.black,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailingText != null)
              Text(
                trailingText,
                style: const TextStyle(color: AppColors.grey, fontSize: 14),
              ),
            if (trailingText != null) const SizedBox(width: 10),
            const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.grey),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
