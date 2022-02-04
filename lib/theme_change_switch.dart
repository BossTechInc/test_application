import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/my_theme.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
   
   return Switch.adaptive(
     activeColor: Colors.white,
     inactiveThumbColor: Colors.black,
     inactiveTrackColor: Colors.black38,
     value:themeProvider.isDarkMode, 
     onChanged: (value){
       final provider = Provider.of<ThemeProvider>(context, listen: false);
       provider.toggleTheme(value);
     },
     );
  }
}