// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/brightness_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final brightness = ref.watch(brightnessProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(HugeIconsStroke.arrowLeft01),
        ),
        title: Text("Login", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            children: [
              const SizedBox(height: 40),
              SvgPicture.asset('assets/$brightness/access_account.svg', height: 200),
              Expanded(child: SizedBox()),
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
                    children: [IconButton(onPressed: () {}, icon: Icon(HugeIconsStroke.google))],
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.of(context).viewPadding.bottom),
            ],
          ),
        ),
      ),
    );
  }
}
