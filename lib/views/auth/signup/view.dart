import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/common/navigations/index.dart';
import 'package:task/common/sizedbox/index.dart';
import 'package:task/common/style/index.dart';
import 'package:task/views/auth/signup/index.dart';
import 'package:task/widgets/index.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
            text: "Create a new!",
            fontWeight: FontWeight.bold,
          ),
          AppSizedBox.sizedBoxHeight10(),
          AppTextStyle.reusableText14(
            text:
                "Please enter your details, both field are required and must be valid.",
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}

Widget buildTextFieldBody(Size size, BuildContext context) {
  final signUpController = Get.put(SignUpController());
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width / 10),
      child: Column(
        children: [
          reusableTextfield(
            context: context,
            size: size,
            controller: signUpController.state.usernameController.value,
            hintText: "Username",
            textCapitalization: TextCapitalization.words,
            prefixIcon: const Icon(Icons.person),
          ),
          AppSizedBox.sizedBoxHeight20(),
          reusableTextfield(
            context: context,
            size: size,
            controller: signUpController.state.emailController.value,
            hintText: "Email",
            keyBoardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
          ),
          AppSizedBox.sizedBoxHeight20(),
          reusableTextfield(
            context: context,
            size: size,
            controller: signUpController.state.phoneController.value,
            hintText: "Phone",
            keyBoardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone),
          ),
          AppSizedBox.sizedBoxHeight20(),
          Obx(
            () => reusableTextfield(
              context: context,
              size: size,
              controller: signUpController.state.passwordController.value,
              hintText: "Password",
              keyBoardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                onPressed: () {
                  signUpController.isPasswordVisibleToggle();
                },
                icon: signUpController.state.isPasswordVisible.value == true
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              ),
              obscureText:
                  signUpController.state.isPasswordVisible.value == true
                      ? false
                      : true,
            ),
          ),
          AppSizedBox.sizedBoxHeight20(),
          Obx(
            () => reusableTextfield(
              context: context,
              size: size,
              controller: signUpController.state.verifyPasswordController.value,
              hintText: "Verify Password",
              keyBoardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {
                  signUpController.isVerifyPasswordVisibleToggle();
                },
                icon:
                    signUpController.state.isVerifyPasswordVisible.value == true
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
              ),
              obscureText:
                  signUpController.state.isVerifyPasswordVisible.value == true
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
  final signUpController = Get.put<SignUpController>(SignUpController());
  return Obx(
    () => SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 10, vertical: size.width / 10),
        child: signUpController.state.isLoading.value == false
            ? reusableElevatedButton(
                size: size,
                lable: "Sign Up",
                onPressed: () async {
                  await signUpController.signup();
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
      padding: EdgeInsets.symmetric(horizontal: size.width / 10),
      child: Row(
        children: [
          AppTextStyle.reusableText14(text: "Already have an account?"),
          TextButton(
            onPressed: () {
              AppNavigations.navigateToBack();
            },
            child: AppTextStyle.reusableText14(
                text: "Sign In", fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
