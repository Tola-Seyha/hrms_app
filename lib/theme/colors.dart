import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.white,   
    primary: Colors.amber.shade400,     
    secondary: Colors.amber.shade400, 

  ) , 
  brightness: Brightness.light, 
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(  
    surface: Colors.orange.shade500,
    primary: Colors.orange.shade200,
  ) 
); 