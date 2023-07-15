import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_practice/bottom_nav/bottom_nav.dart';
import 'package:ui_practice/constant/app_color.dart';
import 'package:ui_practice/constant/app_font_size.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          titleTextStyle: GoogleFonts.quicksand(
            fontSize: FontSize.fontSizeTitle,
            color: Colors.black,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light,
          ),
        ),
        splashFactory: InkSparkle.splashFactory,
        actionIconTheme: ActionIconThemeData(
          closeButtonIconBuilder: (context) {
            return const Icon(Icons.close_outlined);
          },
          backButtonIconBuilder: (context) {
            return const Icon(Icons.arrow_back_ios);
          },
        ),
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: AppColor.white,
            iconTheme: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return size 40, otherwise 20
              if (states.contains(MaterialState.pressed)) {
                return const IconThemeData(size: 32);
              }
              return const IconThemeData(size: 24);
            }),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: AppColor.secondary,
            labelTextStyle: MaterialStateProperty.resolveWith((states) {
              // If the button is pressed, return size 40, otherwise 20
              if (states.contains(MaterialState.pressed)) {
                return GoogleFonts.quicksand(fontSize: FontSize.fontSizeTitle);
              }
              return GoogleFonts.quicksand(fontSize: FontSize.fontSizeRegular);
            })),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.backgroundPrimary,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(
                primary: AppColor.white,
                secondary: AppColor.secondary,
                background: AppColor.secondary,
                surfaceTint: AppColor.white)
            .copyWith(background: AppColor.backgroundPrimary),
      ),
      home: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const MyBottomNavigation()),
    );
  }
}