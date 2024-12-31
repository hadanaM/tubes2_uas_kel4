import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes2_uas_kel4/features/main/controller/main_menu_controller.dart';

class BottomNavBarWidget extends StatelessWidget {
  final MainMenuController controller = Get.find<MainMenuController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.poll), label: 'Vote'),
          ],
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Colors.grey,
        ));
  }
}