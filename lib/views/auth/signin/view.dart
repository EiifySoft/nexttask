import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/navigations/index.dart';
import 'package:task/common/sizedbox/index.dart';
import 'package:task/common/style/index.dart';
import 'package:task/views/auth/signin/index.dart';

import 'package:task/widgets/index.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          buildSignInAppBar(size),
          buildTitleBody(size),
          buildTextFieldBody(size, context),
          buildAuthButton(size),
          buildBottomBody(size),
        ],
      ),
    );
  }
}

Widget buildSignInAppBar(Size size) {
  return SliverAppBar(
    toolbarHeight: 100,
    centerTitle: false,
    title: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 20),
      child: AppTextStyle.reusableText18(
        text: "N E X T T A S K",
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget buildTitleBody(Size size) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.all(size.width / 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextStyle.reusableText24(
            text: "Welcome Back!",
            fontWeight: FontWeight.bold,
          ),
          AppSizedBox.sizedBoxHeight10(),
          AppTextStyle.reusableText14(
            text:
                "Please enter email and password for proceed, both field are required and must be valid.",
          ),
        ],
      ),
    ),
  );
}

Widget buildTextFieldBody(Size size, BuildContext context) {
  final signInController = Get.put(SignInController());
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.all(size.width / 10),
      child: Column(
        children: [
          reusableTextfield(
            context: context,
            size: size,
            controller: signInController.state.emailController.value,
            hintText: "Email",
            keyBoardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
          ),
          AppSizedBox.sizedBoxHeight20(),
          Obx(
            () => reusableTextfield(
              context: context,
              size: size,
              controller: signInController.state.passwordController.value,
              hintText: "Password",
              keyBoardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                onPressed: () {
                  signInController.isPasswordVisibleToggle();
                },
                icon: signInController.state.isPasswordVisible.value == true
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              obscureText:
                  signInController.state.isPasswordVisible.value == true
                      ? false
                      : true,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildAuthButton(Size size) {
  final signInController = Get.put<SignInController>(SignInController());
  return Obx(
    () => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 10, vertical: size.width / 30),
        child: signInController.state.isLoading.value == false
            ? reusableElevatedButton(
                size: size,
                lable: "Sign In",
                onPressed: () async {
                  await signInController.signIn();
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    ),
  );
}

Widget buildBottomBody(Size size) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width / 10, vertical: size.width / 20),
      child: Row(
        children: [
          AppTextStyle.reusableText14(text: "Don't have an account?"),
          TextButton(
            onPressed: () {
              AppNavigations.navigateToSignUpView();
            },
            child: AppTextStyle.reusableText14(
                text: "Register Now", fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
