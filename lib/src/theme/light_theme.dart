

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:job_listing_project/src/theme/light_base_theme.dart';

class LightTheme {
  ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: primaryColor,
    hintColor: tertiaryColor,
    indicatorColor: iconColor,
    focusColor: focusColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor,),
  );
}