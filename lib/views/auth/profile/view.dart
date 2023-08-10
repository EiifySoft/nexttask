import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/colors/index.dart';
import 'package:task/common/sizedbox/index.dart';
import 'package:task/common/style/index.dart';
import 'package:task/views/auth/profile/index.dart';
import 'package:task/widgets/reusable_elevatedbutton.dart';

class SignUpProfileView extends StatelessWidget {
  const SignUpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSignUpProfileAppBar(size),
          buildUploadAvatarBody(size),
          buildProfileDetailsBody(),
          buildUploadButton(size),
        ],
      ),
    );
  }
}

Widget buildSignUpProfileAppBar(Size size) {
  final signUpProfileController =
      Get.put<SignUpProfileController>(SignUpProfileController());
  return SliverAppBar(
    toolbarHeight: 100,
    title: AppTextStyle.reusableText20(
        text: "Upload Profile", fontWeight: FontWeight.w600),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 30),
        child: TextButton(
          onPressed: () {
            signUpProfileController.skipAndNavigateToMainView();
          },
          child: AppTextStyle.reusableText16(
              text: "Skip", textColor: LightModeColor.blueColor),
        ),
      ),
    ],
  );
}

Widget buildUploadAvatarBody(Size size) {
  final signUpProfileController =
      Get.put<SignUpProfileController>(SignUpProfileController());
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
                        signUpProfileController.state.imageFile.value!),
                  ),
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
                              signUpProfileController.pickImage();
                            },
                            child: ListTile(
                              leading: const Icon(Icons.image),
                              title:
                                  AppTextStyle.reusableText18(text: "Gallery"),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              signUpProfileController.clickImage();
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

Widget buildProfileDetailsBody() {
  final signUpProfileController =
      Get.put<SignUpProfileController>(SignUpProfileController());
  return Obx(
    () => SliverToBoxAdapter(
      child: Column(
        children: [
          AppTextStyle.reusableText20(
              text:
                  "${signUpProfileController.state.currentUserData.value.username}",
              fontWeight: FontWeight.w600),
          AppTextStyle.reusableText16(
              text:
                  "${signUpProfileController.state.currentUserData.value.email}",
              textColor: LightModeColor.blueColor.withOpacity(0.5)),
          AppTextStyle.reusableText16(
              text:
                  "${signUpProfileController.state.currentUserData.value.phone}",
              textColor: LightModeColor.blueColor.withOpacity(0.5)),
        ],
      ),
    ),
  );
}

Widget buildUploadButton(Size size) {
  final signUpProfileController =
      Get.put<SignUpProfileController>(SignUpProfileController());
  return Obx(
    () => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(size.width / 30),
        child: signUpProfileController.state.isLoading.value == false
            ? reusableElevatedButton(
                size: size,
                onPressed: () {
                  signUpProfileController.uploadProfilePic();
                },
                lable: "Upload")
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    ),
  );
}
