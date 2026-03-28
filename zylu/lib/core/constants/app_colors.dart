import 'package:flutter/material.dart';

class AppColors {

  static const primary = Color(0xFF3B5EDF); 
  static const primaryLight = Color(0xFF5B7BFF);

  static const secondary = Color(0xFFFFA000);
  static const secondaryLight = Color(0xFFFFC947);


  static const primaryGradient = LinearGradient(
    colors: [Color(0xFF2C3EDC), Color(0xFF6A8BFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const secondaryGradient = LinearGradient(
    colors: [Color(0xFFFFA000), Color(0xFFFFC947)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  
  static const background = Color(0xFFF5F7FB);

}
