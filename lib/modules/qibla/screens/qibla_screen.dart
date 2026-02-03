import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                            "Qibla Finder",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.info_outline, color: Colors.white),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "295° NW",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        const Text(
                          "Mecca, Saudi Arabia",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(height: 50),
                        
                        // Compass Mockup
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            // Outer Ring
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withValues(alpha: 0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                                border: Border.all(color: AppColors.lightGrey, width: 2),
                              ),
                              child: Stack(
                                children: [
                                  // Cardinal Points
                                  const Align(alignment: Alignment.topCenter, child: Padding(padding: EdgeInsets.all(10), child: Text("N", style: TextStyle(fontWeight: FontWeight.bold)))),
                                  const Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.all(10), child: Text("S", style: TextStyle(fontWeight: FontWeight.bold)))),
                                  const Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.all(10), child: Text("E", style: TextStyle(fontWeight: FontWeight.bold)))),
                                  const Align(alignment: Alignment.centerLeft, child: Padding(padding: EdgeInsets.all(10), child: Text("W", style: TextStyle(fontWeight: FontWeight.bold)))),
                                ],
                              ),
                            ),
                            
                            // Kaaba Icon (Target)
                            Transform.translate(
                              offset: const Offset(-60, -60), // Roughly NW
                              child: const Icon(Icons.mosque, color: AppColors.primary, size: 30),
                            ),
                            
                            // Needle
                            AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: -0.5 + (_controller.value * 0.1), // Slight sway
                                  child: child,
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 10,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        topRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 10,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Center Pin
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: AppColors.accent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 50),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            "Calibrate your compass by rotating your device in a figure 8 motion.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: AppColors.grey, fontSize: 12),
                          ),
                        ),
                      ],
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
