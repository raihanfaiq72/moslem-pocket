import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Prayer Schedule",
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
            // Date Header
            Center(
              child: Column(
                children: const [
                  Text(
                    "Jakarta, Indonesia",
                    style: TextStyle(color: AppColors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "7 March 2023",
                    style: TextStyle(color: AppColors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Horizontal Calendar Strip
            SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  bool isSelected = index == 2; // Dummy selected
                  return Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        if (!isSelected)
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${5 + index}",
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            
            // Prayer Times
            const Text(
              "Prayer Times",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black),
            ),
            const SizedBox(height: 15),
            _buildPrayerItem("Imsak", "04:15", false),
            _buildPrayerItem("Subuh", "04:30", true), // Active
            _buildPrayerItem("Dzuhur", "12:05", false),
            _buildPrayerItem("Ashar", "15:15", false),
            _buildPrayerItem("Maghrib", "18:10", false),
            _buildPrayerItem("Isya", "19:20", false),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerItem(String name, String time, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isActive ? Icons.volume_up : Icons.volume_up_outlined,
                color: isActive ? Colors.white : AppColors.grey,
                size: 20,
              ),
              const SizedBox(width: 15),
              Text(
                name,
                style: TextStyle(
                  color: isActive ? Colors.white : AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            time,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
