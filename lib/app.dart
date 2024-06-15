import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/Auth/splash_screen.dart';

import 'package:task_manager/ui/utility/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: lightThemeData()
    );
  }

  ThemeData lightThemeData() {
    return ThemeData(
      inputDecorationTheme:  InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colors.grey.shade400
        ),

    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),


  ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
              foregroundColor: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: 12),
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),

      ),
      textTheme: TextTheme(titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black

      ),
   titleSmall: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
     letterSpacing: 0.4,

    ),

      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
              textStyle: TextStyle(
            fontWeight: FontWeight.w600
        )
        )
      )

    );
  }
}
