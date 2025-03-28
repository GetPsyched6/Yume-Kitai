import 'package:flutter/material.dart';
import 'app_theme_colors.dart';

class AppTheme {
  static ThemeData getDefaultTheme() {
    const defColors = AppThemeColors.defaultColors;
    const baseStyle = TextStyle(
        letterSpacing: 0, fontVariations: [FontVariation('wght', 500.0)]);

    return ThemeData(
      extensions: const [defColors],
      fontFamily: 'NunitoSans',
      textTheme: TextTheme(
        headlineSmall: baseStyle.copyWith(
          fontVariations: [
            const FontVariation('wght', 700),
          ],
        ),
        titleLarge: baseStyle.copyWith(
          fontSize: 18,
          height: 1.1,
          fontVariations: [
            const FontVariation('wght', 700),
          ],
        ),
        bodyLarge: baseStyle,
        bodyMedium: baseStyle.copyWith(
          fontVariations: [
            const FontVariation('wght', 400),
          ],
        ),
        bodySmall: baseStyle,
        labelLarge: baseStyle.copyWith(fontSize: 16),
      ),
      scaffoldBackgroundColor: defColors.surfaceBg,
      appBarTheme: AppBarTheme(backgroundColor: defColors.surfaceBg),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: defColors.surfaceBg,
        indicatorColor: defColors.surfaceHigh,
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: defColors.borderHigh,
            width: 0.5,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) {
          const baseNavStyle =
              TextStyle(fontVariations: [FontVariation('wght', 600.0)]);
          return states.contains(WidgetState.selected)
              ? baseNavStyle.copyWith(color: defColors.foregroundMax) // Selected
              : baseNavStyle.copyWith(
                  color: defColors.foregroundMedium); // Unselected
        }),
        iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (Set<WidgetState> states) => states.contains(WidgetState.selected)
              ? IconThemeData(color: defColors.foregroundMax) // selected
              : IconThemeData(color: defColors.foregroundMedium), //unselected
        ),
      ),
      colorScheme: const ColorScheme.dark(),
    );
  }

  // static ThemeData getLightTheme() {
  //   return ThemeData(); }

  static ThemeData getTheme(String themeName) {
    switch (themeName) {
      case 'default':
        return getDefaultTheme();
      case 'light':
        return getDefaultTheme();
      default:
        return getDefaultTheme();
    }
  }
}
