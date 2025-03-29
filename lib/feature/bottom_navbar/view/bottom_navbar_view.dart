import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manuelschneid/core/const/bottom_navbar_image_path.dart'
    show BottomNavbarImagePath;
import 'package:manuelschneid/feature/bottom_navbar/controller/bottom_navbar_controller.dart'
    show BottomNavbarController;

class BottomNavbarView extends StatelessWidget {
  BottomNavbarView({super.key});

  final BottomNavbarController controller = Get.put(BottomNavbarController());

  final List<Map<String, String>> navItems = [
    {
      'active': BottomNavbarImagePath.activeHome,
      'inactive': BottomNavbarImagePath.inactiveHome,
    },
    {
      'active': BottomNavbarImagePath.activeTraining,
      'inactive': BottomNavbarImagePath.inactiveTraining,
    },
    {
      'active': BottomNavbarImagePath.activeCoach,
      'inactive': BottomNavbarImagePath.inactiveCoach,
    },
    {
      'active': BottomNavbarImagePath.activeGoal,
      'inactive': BottomNavbarImagePath.inactiveGoal,
    },
    {
      'active': BottomNavbarImagePath.activeProfile,
      'inactive': BottomNavbarImagePath.inactiveProfile,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Obx(() => controller.getCurrentScreen())),
          Positioned(
            bottom: 30, // Keep it at the same position
            left: 0,
            right: 0,
            child: Center(
              child: Obx(
                () => ClipRRect(
                  borderRadius: BorderRadius.circular(79),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.transparent, // Make background transparent
                      borderRadius: BorderRadius.circular(79),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF313131,
                        ), // Apply color only inside navbar
                        borderRadius: BorderRadius.circular(79),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(navItems.length, (index) {
                          return GestureDetector(
                            onTap: () => controller.changeTab(index),
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: Image.asset(
                                controller.selectedIndex.value == index
                                    ? navItems[index]['active']!
                                    : navItems[index]['inactive']!,
                                width:
                                    controller.selectedIndex.value == index
                                        ? 100
                                        : 44,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
