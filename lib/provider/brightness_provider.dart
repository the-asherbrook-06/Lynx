// Packages
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

final brightnessProvider = StateNotifierProvider<BrightnessNotifier, String>((ref) {
  return BrightnessNotifier();
});

class BrightnessNotifier extends StateNotifier<String> with WidgetsBindingObserver {
  BrightnessNotifier() : super(_current()) {
    WidgetsBinding.instance.addObserver(this);
  }

  static String _current() {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    return brightness == Brightness.light ? 'dark' : 'light';
  }

  @override
  void didChangePlatformBrightness() {
    state = _current();
  }
}