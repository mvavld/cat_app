import 'package:cat_app/resources/app_colors.dart';
import 'package:flutter/services.dart';

class AppStyles {
  static SystemUiOverlayStyle darkStyle = const SystemUiOverlayStyle(
    statusBarColor: AppColors.endGradientBackground,
    statusBarIconBrightness: Brightness
        .light, // Only for Android; Light: light icons; Dark: dark icons;
    statusBarBrightness:
        Brightness.dark, // Only for IOS; Dark: light icons; Light: dark icons;
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.endGradientBackground,
  );

  static SystemUiOverlayStyle lightStyle = const SystemUiOverlayStyle(
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.white,
  );
}
