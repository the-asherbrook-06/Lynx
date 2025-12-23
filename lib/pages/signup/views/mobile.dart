// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/signup_controller_provider.dart';
import 'package:lynx/provider/brightness_provider.dart';
import 'package:lynx/provider/auth_provider.dart';

class SignupPageMobile extends ConsumerWidget {
  const SignupPageMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(signupControllerProvider.notifier);
    final brightness = ref.watch(brightnessProvider);
    final state = ref.watch(signupControllerProvider);

    ref.listen(authControllerProvider, (_, state) {
      state.whenOrNull(
        data: (_) => Navigator.pushReplacementNamed(context, '/verify'),
        error: (e, _) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Sign Up", style: Theme.of(context).textTheme.headlineSmall),
        leading: IconButton(
          icon: Icon(HugeIconsStroke.arrowLeft01),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              SvgPicture.asset('assets/$brightness/sign_up.svg', height: 200),
              const Spacer(),
              TextFormField(
                controller: controller.nameController,
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
                decoration: InputDecoration(
                  label: Text("Name"),
                  prefixIcon: Icon(HugeIconsStroke.user03),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.emailController,
                validator: (v) => v != null && v.contains('@') ? null : 'Invalid email',
                decoration: InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(HugeIconsStroke.mail01),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.passwordController,
                obscureText: state.obscurePassword,
                validator: (v) => v != null && v.length >= 6 ? null : 'Min 6 characters',
                decoration: InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(HugeIconsStroke.squareLockPassword),
                  suffixIcon: IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Icon(
                      state.obscurePassword ? HugeIconsStroke.view : HugeIconsStroke.viewOffSlash,
                    ),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: controller.repeatPasswordController,
                obscureText: state.obscureRepeatPassword,
                validator: (v) =>
                    v == controller.passwordController.text ? null : 'Passwords do not match',
                decoration: InputDecoration(
                  label: Text("Repeat Password"),
                  prefixIcon: Icon(HugeIconsStroke.squareLockPassword),
                  suffixIcon: IconButton(
                    onPressed: controller.toggleRepeatPasswordVisibility,
                    icon: Icon(
                      state.obscureRepeatPassword
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
                child: state.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(20)),
                          ),
                        ),
                        onPressed: controller.signup,
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
    );
  }
}
