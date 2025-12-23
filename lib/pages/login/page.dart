// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter/material.dart';

// Pages
import 'package:lynx/pages/login/views/mobile.dart';
import 'package:lynx/pages/login/views/tablet.dart';
import 'package:lynx/pages/login/views/desktop.dart';
import 'package:lynx/pages/login/views/largeDesktop.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Breakpoints.mobile.isBreakpoint(context);
    final isTablet = Breakpoints.tablet.isBreakpoint(context);
    final isDesktop = Breakpoints.desktop.isBreakpoint(context);

    return isMobile
        ? LoginPageMobile()
        : isTablet
        ? LoginPageTablet()
        : isDesktop
        ? LoginPageDesktop()
        : LoginPageLargeDesktop();
  }
}
