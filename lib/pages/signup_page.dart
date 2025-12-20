// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/brightness_provider.dart';
import 'package:lynx/provider/auth_provider.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
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

    ref.listen(authControllerProvider, (_, state) {
      state.whenOrNull(
        error: (e, _) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        },
        data: (_) {
          Navigator.pushReplacementNamed(context, '/verify');
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
              title: Text("Sign Up", style: Theme.of(context).textTheme.headlineSmall),
            ),
      body: Form(
        key: _formKey,
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
                    controller: _nameController,
                    validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
                    decoration: InputDecoration(
                      label: Text("Name"),
                      prefixIcon: Icon(HugeIconsStroke.user03),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _emailController,
                    validator: (v) => v != null && v.contains('@') ? null : 'Invalid email',
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
                    validator: (v) => v != null && v.length >= 6 ? null : 'Min 6 characters',
                    decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(HugeIconsStroke.squareLockPassword),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword ? HugeIconsStroke.view : HugeIconsStroke.viewOffSlash,
                        ),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _repeatPasswordController,
                    obscureText: _obscureRepeatPassword,
                    validator: (v) =>
                        v == _passwordController.text ? null : 'Passwords do not match',
                    decoration: InputDecoration(
                      label: Text("Repeat Password"),
                      prefixIcon: Icon(HugeIconsStroke.squareLockPassword),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureRepeatPassword = !_obscureRepeatPassword;
                          });
                        },
                        icon: Icon(
                          _obscureRepeatPassword
                              ? HugeIconsStroke.view
                              : HugeIconsStroke.viewOffSlash,
                        ),
                      ),
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
                                    if (_formKey.currentState!.validate()) {
                                      ref
                                          .read(authControllerProvider.notifier)
                                          .signUp(
                                            name: _nameController.text.trim(),
                                            email: _emailController.text.trim(),
                                            password: _passwordController.text.trim(),
                                          );
                                    }
                                  },
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                  ),
                  // const SizedBox(height: 8),
                  // Divider(),
                  // const SizedBox(height: 8),
                  // Column(
                  //   children: [
                  //     Text("Sign in using"),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         IconButton(onPressed: () {}, icon: Icon(HugeIconsStroke.google)),
                  //       ],
                  //     ),
                  //   ],
                  // ),
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
