
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;  
    notifyListeners();
}
}

class MyThemes{
  static final darkTheme = ThemeData(
   primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
        primaryColorLight: Colors.black,
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,      
        indicatorColor: Colors.white,
        canvasColor: Colors.black,
        // next line is important!

  );

  static final lightTheme = ThemeData(
   primaryColor: Colors.white,
       
        canvasColor: Colors.white,
      
        
       
  );
}