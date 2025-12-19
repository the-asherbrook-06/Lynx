import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../provider/brightness_provider.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  Timer? _navTimer;

  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);

    _logoScale = Tween<double>(
      begin: 0.92,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));


    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _controller.forward();
    });
    _navTimer = Timer(const Duration(seconds: 6), _goNext);
  }

  void _goNext() {
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (route) => false);
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Breakpoints.tablet.isBreakpoint(context);
    final isDesktop = Breakpoints.desktop.isBreakpoint(context);
    final isLargeDesktop = Breakpoints.largeDesktop.isBreakpoint(context);

    final brightnessFolder = ref.watch(brightnessProvider);

    final media = MediaQuery.of(context);
    final size = media.size;
    final bottomInset = media.viewPadding.bottom;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final containerHeight = (isDesktop || isLargeDesktop)
        ? size.height * 0.9
        : isTablet
        ? size.height * 0.8
        : size.height;

    final containerWidth = isLargeDesktop
        ? size.width * 0.4
        : isDesktop
        ? size.width * 0.6
        : isTablet
        ? size.width * 0.8
        : size.width;

    final cardPadding = (isTablet || isDesktop || isLargeDesktop)
        ? const EdgeInsets.all(16)
        : EdgeInsets.zero;

    final cardMargin = (isTablet || isDesktop || isLargeDesktop)
        ? const EdgeInsets.all(16)
        : EdgeInsets.zero;

    final cardColor = (isTablet || isDesktop || isLargeDesktop)
        ? colorScheme.surfaceContainer
        : colorScheme.surface;

    final loaderSize = isLargeDesktop
        ? 56.0
        : isDesktop
        ? 52.0
        : isTablet
        ? 48.0
        : 44.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Container(
            height: containerHeight,
            width: containerWidth,
            padding: cardPadding,
            margin: cardMargin,
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(34),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return FadeTransition(
                  opacity: _fade,

                  child: Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      ScaleTransition(
                        scale: _logoScale,
                        child: SvgPicture.asset(
                          'assets/$brightnessFolder/messaging_fun.svg',
                          height: isDesktop || isLargeDesktop ? 260 : 220,
                        ),
                      ),

                      const SizedBox(height: 20),
                      Text("Lynx", style: textTheme.displaySmall),
                      const SizedBox(height: 4),
                      Text(
                        "Connect, Organize, Flow",
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),

                      const Expanded(child: SizedBox()),

                      LoadingAnimationWidget.threeArchedCircle(
                        color: colorScheme.primary,
                        size: loaderSize,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "V.0.0.1",
                        style: textTheme.labelMedium?.copyWith(
                          color: colorScheme.outline,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(height: bottomInset),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
