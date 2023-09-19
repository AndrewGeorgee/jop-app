import 'package:flutter/material.dart';
import 'package:job_application/core/utils/styles.dart';

import '../utils/colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)),
      textTheme: TextTheme(
        bodyLarge: Styles.textStyles15,
        bodyMedium: Styles.textStyles15,
        bodySmall: Styles.textStyles15,
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // contentPadding:
        //     const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        errorBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedErrorBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
      width: 1.5, color: ColorManager.textFormFeildColor), //<-- SEE HERE
  borderRadius: BorderRadius.circular(10.0),
);
BorderRadiusGeometry borderRadius = BorderRadius.circular(15);
