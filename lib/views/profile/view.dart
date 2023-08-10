import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/colors/index.dart';
import 'package:task/common/navigations/index.dart';
import 'package:task/common/sizedbox/index.dart';
import 'package:task/common/style/index.dart';
import 'package:task/services/auth_service.dart';
import 'package:task/views/main/index.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          buildProfileAppBar(),
          buildProfileDetailsBody(size),
          buildProfileMenuBody(size),
        ],
      ),
    );
  }
}

Widget buildProfileAppBar() {
  return SliverAppBar(
    centerTitle: false,
    toolbarHeight: 75,
    title: AppTextStyle.reusableText20(
        text: "Profile", fontWeight: FontWeight.w500),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      ),
    ],
  );
}

Widget buildProfileDetailsBody(Size size) {
  final mainController = Get.put<MainController>(MainController());
  return Obx(
    () => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(size.width / 30),
        child: Container(
          padding: EdgeInsets.all(size.width / 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width / 40),
            color: LightModeColor.whiteColor,
            boxShadow: [
              BoxShadow(
                color: LightModeColor.blueColor.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 10,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: size.width / 4,
                    width: size.width / 4,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: LightModeColor.whiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: LightModeColor.blueColor.withOpacity(0.2),
                          spreadRadius: 10,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.network(
                        "${mainController.state.currentUserData.value.photoUrl}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AppSizedBox.sizedBoxWidth20(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextStyle.reusableText18(
                        text:
                            "${mainController.state.currentUserData.value.username}",
                        fontWeight: FontWeight.bold,
                      ),
                      AppTextStyle.reusableText14(
                          text: "Administrator Account",
                          textColor: LightModeColor.blueColor.withOpacity(0.5)),
                    ],
                  ),
                ],
              ),
              AppSizedBox.sizedBoxHeight20(),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.email,
                          color: LightModeColor.blueColor.withOpacity(0.5)),
                      AppSizedBox.sizedBoxWidth10(),
                      AppTextStyle.reusableText16(
                          text:
                              "${mainController.state.currentUserData.value.email}",
                          textColor: LightModeColor.blueColor.withOpacity(0.5))
                    ],
                  ),
                  AppSizedBox.sizedBoxHeight10(),
                  Row(
                    children: [
                      Icon(Icons.phone,
                          color: LightModeColor.blueColor.withOpacity(0.5)),
                      AppSizedBox.sizedBoxWidth10(),
                      AppTextStyle.reusableText16(
                          text:
                              "${mainController.state.currentUserData.value.phone}",
                          textColor: LightModeColor.blueColor.withOpacity(0.5))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildProfileMenuBody(Size size) {
  return SliverToBoxAdapter(
    child: Container(
      padding: EdgeInsets.all(size.width / 30),
      margin: EdgeInsets.all(size.width / 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width / 40),
        color: LightModeColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: LightModeColor.blueColor.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              AppNavigations.navigateToEditProfileView();
            },
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: AppTextStyle.reusableText18(text: "Edit Profile"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: AppTextStyle.reusableText18(text: "Settings"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: AppTextStyle.reusableText18(text: "Notification Settings"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: AppTextStyle.reusableText18(text: "Privacy Plicy"),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ),
          InkWell(
            onTap: () async {
              await AuthService().signOut();
            },
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: AppTextStyle.reusableText18(text: "Log Out"),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
