// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

// Provider
import '../provider/brightness_provider.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = Breakpoints.tablet.isBreakpoint(context);
    final isDesktop = Breakpoints.desktop.isBreakpoint(context);
    final isLargeDesktop = Breakpoints.largeDesktop.isBreakpoint(context);
    final brightness = ref.watch(brightnessProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Center(
          child: Container(
            height: isDesktop || isLargeDesktop
                ? MediaQuery.of(context).size.height * 0.9
                : isTablet
                ? MediaQuery.of(context).size.height * 0.8
                : MediaQuery.of(context).size.height,
            width: isLargeDesktop
                ? MediaQuery.of(context).size.width * 0.4
                : isDesktop
                ? MediaQuery.of(context).size.width * 0.6
                : isTablet
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width,
            padding: isTablet || isDesktop || isLargeDesktop ? EdgeInsets.all(16) : EdgeInsets.zero,
            margin: isTablet || isDesktop || isLargeDesktop ? EdgeInsets.all(16) : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: isTablet || isDesktop || isLargeDesktop
                  ? Theme.of(context).colorScheme.surfaceContainer
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(34),
            ),
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                SvgPicture.asset('assets/$brightness/messaging_fun.svg', height: 220),
                const SizedBox(height: 20),
                Text("Lynx", style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 4),
                Text("Connect, Organize, Flow", style: Theme.of(context).textTheme.bodyMedium),
                Expanded(child: SizedBox()),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primaryContainer,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}