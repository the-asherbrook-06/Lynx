// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter/material.dart';

// Pages
import 'package:lynx/pages/signup/views/mobile.dart';
import 'package:lynx/pages/signup/views/tablet.dart';
import 'package:lynx/pages/signup/views/desktop.dart';
import 'package:lynx/pages/signup/views/largeDesktop.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.mobile.isBreakpoint(context);
    final isTablet = Breakpoints.tablet.isBreakpoint(context);
    final isDesktop = Breakpoints.desktop.isBreakpoint(context);

    return isMobile
        ? SignupPageMobile()
        : isTablet
        ? SignupPageTablet()
        : isDesktop
        ? SignupPageDesktop()
        : SignupPageLargeDesktop();
  }
}
