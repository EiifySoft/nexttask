import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/colors/index.dart';
import 'package:task/common/sizedbox/index.dart';
import 'package:task/common/style/index.dart';
import 'package:task/views/profile/edit_profile.dart/controller.dart';
import 'package:task/widgets/index.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          buildEditProfileAppBar(),
          buildUploadAvatarBody(size),
          buildTextFieldBody(size, context),
          buildUpdateButton(size),
        ],
      ),
    );
  }
}

Widget buildEditProfileAppBar() {
  return SliverAppBar(
    centerTitle: false,
    toolbarHeight: 75,
    title: AppTextStyle.reusableText20(
        text: "Edit Profile", fontWeight: FontWeight.w500),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      ),
    ],
  );
}

Widget buildUploadAvatarBody(Size size) {
  final editProfileController =
      Get.put<EditProfileController>(EditProfileController());
  return SliverToBoxAdapter(
    child: Center(
      child: Container(
        height: size.width / 2,
        width: size.width / 2,
        margin: EdgeInsets.symmetric(vertical: size.width / 30),
        decoration: BoxDecoration(
          color: LightModeColor.whiteColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: LightModeColor.blueColor.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Stack(
          children: [
            Obx(() => Center(
                  child: CircleAvatar(
                      radius: 100,
                      backgroundImage: FileImage(
                          editProfileController.state.imageFile.value!)),
                )),
            Positioned(
              bottom: 35,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      height: size.width / 2,
                      padding: EdgeInsets.all(size.width / 30),
                      decoration: BoxDecoration(
                        color: LightModeColor.whiteColor,
                        borderRadius: BorderRadius.circular(size.width / 40),
                      ),
                      child: Column(
                        children: [
                          AppTextStyle.reusableText22(
                              text: "Choose Profile Photo",
                              fontWeight: FontWeight.w600),
                          AppSizedBox.sizedBoxHeight20(),
                          InkWell(
                            onTap: () {
                              editProfileController.pickImage();
                            },
                            child: ListTile(
                              leading: const Icon(Icons.image),
                              title:
                                  AppTextStyle.reusableText18(text: "Gallery"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              editProfileController.clickImage();
                            },
                            child: ListTile(
                              leading: const Icon(Icons.camera),
                              title:
                                  AppTextStyle.reusableText18(text: "Camera"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: LightModeColor.blueColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildTextFieldBody(Size size, BuildContext context) {
  final editProfileController =
      Get.put<EditProfileController>(EditProfileController());
  return Obx(
    () => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(size.width / 20),
        child: Column(
          children: [
            reusableTextfield(
              context: context,
              size: size,
              prefixIcon: const Icon(Icons.person),
              controller: editProfileController.state.usernameController.value,
            ),
            AppSizedBox.sizedBoxHeight20(),
            reusableTextfield(
              context: context,
              size: size,
              prefixIcon: const Icon(Icons.email),
              keyBoardType: TextInputType.emailAddress,
              controller: editProfileController.state.emailController.value,
            ),
            AppSizedBox.sizedBoxHeight20(),
            reusableTextfield(
              context: context,
              size: size,
              prefixIcon: const Icon(Icons.phone),
              keyBoardType: TextInputType.phone,
              controller: editProfileController.state.phoneController.value,
            ),
            AppSizedBox.sizedBoxHeight20(),
            reusableTextfield(
              context: context,
              size: size,
              prefixIcon: const Icon(Icons.key),
              controller: editProfileController.state.passwordController.value,
              obscureText: true,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildUpdateButton(Size size) {
  final editProfileController =
      Get.put<EditProfileController>(EditProfileController());
  return Obx(() => SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(size.width / 20),
          child: editProfileController.state.isLoading.value == false
              ? reusableElevatedButton(
                  size: size,
                  onPressed: () async {
                    await editProfileController.updateProfile();
                  },
                  lable: "Update Profile")
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ));
}
