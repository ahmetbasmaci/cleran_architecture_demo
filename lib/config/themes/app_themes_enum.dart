import 'package:flutter/material.dart';

// enum MyThemes {
//   blueLight('Blue Light'),
//   redLight('Red Light'),
//   blueDark('Blue Dark'),
//   redDark('Red Dark'),
//   ;

//   final String value;

//   const MyThemes(this.value);
// }

// final appThemeData = {
//   MyThemes.blueLight: ThemeData(colorScheme: ColorScheme.light(primary: Colors.blue)),
//   MyThemes.redLight: ThemeData(colorScheme: ColorScheme.light(primary: Colors.red)),
//   MyThemes.blueDark: ThemeData(colorScheme: ColorScheme.dark(primary: Colors.blue)),
//   MyThemes.redDark: ThemeData(colorScheme: ColorScheme.dark(primary: Colors.red)),
// };

class AppThemes {
  static List<MyThemeData> myThemes = [blueLight, redLight, blueDark, redDark];
  static MyThemeData blueLight = MyThemeData(
    name: 'Blue Light',
    themeData: ThemeData(colorScheme: ColorScheme.light(primary: Colors.blue)),
  );

  static MyThemeData redLight = MyThemeData(
    name: 'Red Light',
    themeData: ThemeData(colorScheme: ColorScheme.light(primary: Colors.red)),
  );

  static MyThemeData blueDark = MyThemeData(
    name: 'Blue Dark',
    themeData: ThemeData(colorScheme: ColorScheme.dark(primary: Colors.blue)),
  );

  static MyThemeData redDark = MyThemeData(
    name: 'Red Dark',
    themeData: ThemeData(colorScheme: ColorScheme.dark(primary: Colors.red)),
  );
}

class MyThemeData {
  ThemeData themeData;
  String name;

  MyThemeData({required this.themeData, required this.name});
}
/*
ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      hintColor: AppColors.hint,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: AppStrings.fontFamily.name,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );


*/