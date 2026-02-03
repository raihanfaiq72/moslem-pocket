import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Teal Header Background
          Container(
            height: 250, // Taller to fit Avatar/Info
            color: AppColors.primary,
          ),
          
          SafeArea(
            child: Column(
              children: [
                // AppBar Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: SizedBox()), // Spacer to center title
                      const Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.settings_outlined, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // User Info (Avatar + Name) in Teal Area
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: const DecorationImage(
                              image: NetworkImage("https://i.pravatar.cc/300"), // Dummy avatar
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(color: Colors.white, width: 3),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: AppColors.accent,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.edit, color: AppColors.primaryDark, size: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Putri Zahra",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Text(
                      "putrizahra@example.com",
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // White Sheet Content
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
                        children: [
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
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.accent.withValues(alpha: 0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
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
                  ),
                ),
              ],
            ),
          ),
        ],
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
