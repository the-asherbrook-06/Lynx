// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/auth_provider.dart';
import 'package:lynx/provider/brightness_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Breakpoints.tablet.isBreakpoint(context);
    final isDesktop = Breakpoints.desktop.isBreakpoint(context);
    final isLargeDesktop = Breakpoints.largeDesktop.isBreakpoint(context);

    final brightness = ref.watch(brightnessProvider);
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState is AsyncLoading;

    ref.listen(authControllerProvider, (_, state) async {
      state.whenOrNull(
        data: (_) async {
          final isVerified = await ref.read(authControllerProvider.notifier).checkEmailVerified();

          if (!context.mounted) return;

          if (isVerified) {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
          } else {
            Navigator.pushNamedAndRemoveUntil(context, '/verify', (_) => false);
          }
        },
        error: (e, _) {
          final message = e.toString();

          if (message.contains('user-not-found')) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Email not registered')));

            Navigator.pushReplacementNamed(context, '/signup');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          }
        },
      );
    });

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
              title: Text("Login", style: Theme.of(context).textTheme.headlineSmall),
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
                        Text("Login", style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  const SizedBox(height: 40),
                  SvgPicture.asset('assets/$brightness/access_account.svg', height: 200),
                  Expanded(child: SizedBox()),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      prefixIcon: Icon(HugeIconsStroke.mail01),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(HugeIconsStroke.squareLockPassword),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(_obscurePassword? HugeIconsStroke.view: HugeIconsStroke.viewOffSlash),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                        child: Text("Sign Up"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 52,
                    width: double.infinity,
                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.primaryContainer,
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(20),
                                ),
                              ),
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                                    ref
                                        .read(authControllerProvider.notifier)
                                        .login(
                                          email: _emailController.text.trim(),
                                          password: _passwordController.text.trim(),
                                        );
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
