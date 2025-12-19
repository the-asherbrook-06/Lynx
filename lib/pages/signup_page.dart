// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/brightness_provider.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final isTablet = Breakpoints.tablet.isBreakpoint(context);
    final isDesktop = Breakpoints.desktop.isBreakpoint(context);
    final isLargeDesktop = Breakpoints.largeDesktop.isBreakpoint(context);
    final brightness = ref.watch(brightnessProvider);
    return Scaffold(
      appBar: (isDesktop || isLargeDesktop)
          ? null
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(HugeIconsStroke.arrowLeft01),
              ),
              centerTitle: false,
              title: Text("Sign Up", style: Theme.of(context).textTheme.headlineSmall),
            ),
      body: Form(
        child: Padding(
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
              padding: isTablet || isDesktop || isLargeDesktop
                  ? EdgeInsets.all(16)
                  : EdgeInsets.zero,
              margin: isTablet || isDesktop || isLargeDesktop
                  ? EdgeInsets.all(16)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                color: isTablet || isDesktop || isLargeDesktop
                    ? Theme.of(context).colorScheme.surfaceContainer
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(34),
              ),
              child: Column(
                children: [
                  if (isDesktop || isLargeDesktop)
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(HugeIconsStroke.arrowLeft01),
                        ),
                        const SizedBox(width: 8),
                        Text("Sign Up", style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  const SizedBox(height: 40),
                  SvgPicture.asset('assets/$brightness/sign_up.svg', height: 200),
                  Expanded(child: SizedBox()),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Name"),
                      prefixIcon: Icon(HugeIconsStroke.user03),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Email"),
                      prefixIcon: Icon(HugeIconsStroke.mail01),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(HugeIconsStroke.squareLockPassword),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Repeat Password"),
                      prefixIcon: Icon(HugeIconsStroke.squareLockPassword),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: Text("Login"),
                      ),
                    ],
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
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      Text("Sign in using"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(HugeIconsStroke.google)),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}