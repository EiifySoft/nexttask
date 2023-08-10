import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/colors/index.dart';
import 'package:task/views/main/index.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        if (controller.state.currentIndex.value != 0) {
          controller.state.currentIndex.value = 0;
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() => controller.state.views
                .elementAt(controller.state.currentIndex.value)),
            Align(
              alignment: Alignment.bottomCenter,
              child: buildBottomNavigationBar(size),
            ),
          ],
        ),
        bottomNavigationBar: const SizedBox(),
      ),
    );
  }
}

Widget buildBottomNavigationBar(Size size) {
  final mainController = Get.put<MainController>(MainController());
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: size.width / 20, vertical: size.width / 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(size.width / 40),
      boxShadow: [
        BoxShadow(
          color: LightModeColor.blueColor.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 10,
        ),
      ],
    ),
    child: Obx(
      () => ClipRRect(
        borderRadius: BorderRadius.circular(size.width / 40),
        child: BottomNavigationBar(
          backgroundColor: LightModeColor.blueColor,
          selectedItemColor: LightModeColor.whiteColor,
          unselectedItemColor: LightModeColor.whiteColor.withOpacity(0.3),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: mainController.state.currentIndex.value,
          onTap: (value) {
            mainController.state.currentIndex.value = value;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    ),
  );
}
