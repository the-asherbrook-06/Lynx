import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8a5022),
      surfaceTint: Color(0xff8a5022),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdcc6),
      onPrimaryContainer: Color(0xff6d390c),
      secondary: Color(0xff755845),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffdcc6),
      onSecondaryContainer: Color(0xff5b412f),
      tertiary: Color(0xff5f6135),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe5e6ae),
      onTertiaryContainer: Color(0xff47491f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4d4639),
      outline: Color(0xff7f7667),
      outlineVariant: Color(0xffd0c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffffb784),
      primaryFixed: Color(0xffffdcc6),
      onPrimaryFixed: Color(0xff301400),
      primaryFixedDim: Color(0xffffb784),
      onPrimaryFixedVariant: Color(0xff6d390c),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff2b1708),
      secondaryFixedDim: Color(0xffe4bfa8),
      onSecondaryFixedVariant: Color(0xff5b412f),
      tertiaryFixed: Color(0xffe5e6ae),
      onTertiaryFixed: Color(0xff1b1d00),
      tertiaryFixedDim: Color(0xffc8ca94),
      onTertiaryFixedVariant: Color(0xff47491f),
      surfaceDim: Color(0xffe2d9cc),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff6eddf),
      surfaceContainerHigh: Color(0xfff0e7d9),
      surfaceContainerHighest: Color(0xffebe1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff582900),
      surfaceTint: Color(0xff8a5022),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9c5e2f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff493120),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff856753),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff363810),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6e7042),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff3c3529),
      outline: Color(0xff595244),
      outlineVariant: Color(0xff746c5d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffffb784),
      primaryFixed: Color(0xff9c5e2f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff7f4719),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff856753),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6a4f3c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6e7042),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff55572c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec5b8),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff0e7d9),
      surfaceContainerHigh: Color(0xffe5dcce),
      surfaceContainerHighest: Color(0xffd9d0c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff492100),
      surfaceTint: Color(0xff8a5022),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff703b0e),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3d2717),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5e4432),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2c2e07),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff494c22),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff312b1f),
      outlineVariant: Color(0xff4f483b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffffb784),
      primaryFixed: Color(0xff703b0e),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff532700),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5e4432),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff452d1d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff494c22),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff33350d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b8ab),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9efe2),
      surfaceContainer: Color(0xffebe1d4),
      surfaceContainerHigh: Color(0xffdcd3c6),
      surfaceContainerHighest: Color(0xffcec5b8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb784),
      surfaceTint: Color(0xffffb784),
      onPrimary: Color(0xff4f2500),
      primaryContainer: Color(0xff6d390c),
      onPrimaryContainer: Color(0xffffdcc6),
      secondary: Color(0xffe4bfa8),
      onSecondary: Color(0xff422b1b),
      secondaryContainer: Color(0xff5b412f),
      onSecondaryContainer: Color(0xffffdcc6),
      tertiary: Color(0xffc8ca94),
      onTertiary: Color(0xff30330b),
      tertiaryContainer: Color(0xff47491f),
      onTertiaryContainer: Color(0xffe5e6ae),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff17130b),
      onSurface: Color(0xffebe1d4),
      onSurfaceVariant: Color(0xffd0c5b4),
      outline: Color(0xff999080),
      outlineVariant: Color(0xff4d4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff8a5022),
      primaryFixed: Color(0xffffdcc6),
      onPrimaryFixed: Color(0xff301400),
      primaryFixedDim: Color(0xffffb784),
      onPrimaryFixedVariant: Color(0xff6d390c),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff2b1708),
      secondaryFixedDim: Color(0xffe4bfa8),
      onSecondaryFixedVariant: Color(0xff5b412f),
      tertiaryFixed: Color(0xffe5e6ae),
      onTertiaryFixed: Color(0xff1b1d00),
      tertiaryFixedDim: Color(0xffc8ca94),
      onTertiaryFixedVariant: Color(0xff47491f),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2e2921),
      surfaceContainerHighest: Color(0xff39342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd4b8),
      surfaceTint: Color(0xffffb784),
      onPrimary: Color(0xff3f1c00),
      primaryContainer: Color(0xffc5814f),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffbd5bc),
      onSecondary: Color(0xff362111),
      secondaryContainer: Color(0xffab8a75),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffdee0a8),
      onTertiary: Color(0xff262802),
      tertiaryContainer: Color(0xff929462),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe6dbc9),
      outline: Color(0xffbbb1a0),
      outlineVariant: Color(0xff988f7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff6f3a0d),
      primaryFixed: Color(0xffffdcc6),
      onPrimaryFixed: Color(0xff210b00),
      primaryFixedDim: Color(0xffffb784),
      onPrimaryFixedVariant: Color(0xff582900),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff1e0d02),
      secondaryFixedDim: Color(0xffe4bfa8),
      onSecondaryFixedVariant: Color(0xff493120),
      tertiaryFixed: Color(0xffe5e6ae),
      onTertiaryFixed: Color(0xff111200),
      tertiaryFixedDim: Color(0xffc8ca94),
      onTertiaryFixedVariant: Color(0xff363810),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff49443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2c271f),
      surfaceContainerHigh: Color(0xff373229),
      surfaceContainerHighest: Color(0xff423d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece2),
      surfaceTint: Color(0xffffb784),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb17b),
      onPrimaryContainer: Color(0xff180700),
      secondary: Color(0xffffece2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe0bba4),
      onSecondaryContainer: Color(0xff170700),
      tertiary: Color(0xfff2f4bb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc4c690),
      onTertiaryContainer: Color(0xff0b0c00),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffaeedc),
      outlineVariant: Color(0xffccc1b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff6f3a0d),
      primaryFixed: Color(0xffffdcc6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb784),
      onPrimaryFixedVariant: Color(0xff210b00),
      secondaryFixed: Color(0xffffdcc6),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe4bfa8),
      onSecondaryFixedVariant: Color(0xff1e0d02),
      tertiaryFixed: Color(0xffe5e6ae),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc8ca94),
      onTertiaryFixedVariant: Color(0xff111200),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff554f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff343027),
      surfaceContainerHigh: Color(0xff403b31),
      surfaceContainerHighest: Color(0xff4b463c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
