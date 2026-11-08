// app_theme_extension.dart
import 'package:flutter/material.dart';

import 'app_colors.dart';

@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  final Color success;
  final Color warning;
  final Color info;

  const AppCustomColors({
    required this.success,
    required this.warning,
    required this.info,
  });

  @override
  AppCustomColors copyWith({Color? success, Color? warning, Color? info}) {
    return AppCustomColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
    return AppCustomColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
    );
  }

  // Wayve Light Variant
  static const light = AppCustomColors(
    success: AppColors.success, // #10B981 (Mint Horizon)
    warning: AppColors.warning, // #F59E0B (Amber Dusk)
    info: AppColors.info, // #06B6D4 (Coastal Teal)
  );

  // Wayve Dark Variant (tuned slightly brighter for contrast on dark backgrounds)
  static const dark = AppCustomColors(
    success: Color(0xFF34D399), // Mint Glow
    warning: Color(0xFFFBBF24), // Warm Amber
    info: Color(0xFF38BDF8), // Sky Teal
  );
}
