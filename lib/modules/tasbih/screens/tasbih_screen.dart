import 'package:flutter/material.dart';
import 'package:moslem_pocket/constants/app_colors.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _counter = 0;
  int _target = 33;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > _target) {
        _counter = 1; // Loop back or stop? Let's loop for now or reset
        // Or maybe vibrate?
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
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
                            "Digital Tasbih",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balance the back button
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
                        // Target Selector
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.lightGrey),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: _target,
                              items: const [
                                DropdownMenuItem(value: 33, child: Text("Target: 33")),
                                DropdownMenuItem(value: 99, child: Text("Target: 99")),
                                DropdownMenuItem(value: 1000, child: Text("Target: 1000")),
                              ],
                              onChanged: (val) {
                                setState(() {
                                  _target = val!;
                                  _counter = 0;
                                });
                              },
                            ),
                          ),
                        ),
                        
                        const Spacer(),
                        
                        // Counter Display & Button
                        GestureDetector(
                          onTap: _incrementCounter,
                          child: Container(
                            width: 250,
                            height: 250,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              gradient: const LinearGradient(
                                colors: [AppColors.primary, AppColors.primaryDark],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$_counter",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "/ $_target",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                        const Spacer(),
                        
                        // Reset Button
                        TextButton.icon(
                          onPressed: _resetCounter,
                          icon: const Icon(Icons.refresh, color: AppColors.grey),
                          label: const Text("Reset Counter", style: TextStyle(color: AppColors.grey)),
                        ),
                        
                        const SizedBox(height: 40),
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
