// packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lynx/pages/login_page.dart';
import 'package:lynx/pages/signup_page.dart';

// themes
import 'package:lynx/theme/theme.dart';
import 'package:lynx/theme/util.dart';

// Pages
import 'package:lynx/pages/welcome_page.dart';

void main() {
  runApp(ProviderScope(child: const Lynx()));
}

class Lynx extends StatelessWidget {
  const Lynx({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Livvic", "Raleway");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: "Lynx",
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      routes: {
        '/': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignupPage(),
      },
    );
  }
}
