import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/common/colors/index.dart';
import 'package:task/common/routes/index.dart';
import 'package:task/gloabl.dart';

void main() async {
  await Global().globalInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'N E X T T A S K',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: LightModeColor.backgroundColor,
        brightness: Brightness.light,
      ),
      getPages: AppRoutes.appRoutes,
      initialRoute: NamedRoutes.SPLASH,
    );
  }
}
