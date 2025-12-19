// packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

// themes
import 'package:lynx/theme/theme.dart';
import 'package:lynx/theme/util.dart';

// Pages
import 'package:lynx/pages/welcome_page.dart';
import 'package:lynx/pages/login_page.dart';
import 'package:lynx/pages/signup_page.dart';
import 'package:lynx/pages/verify_page.dart';
import 'package:lynx/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const Lynx()));
}

class Lynx extends StatelessWidget {
  const Lynx({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Livvic", "Raleway");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: "Lynx",
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.dark(),
      initialRoute: '/welcome',
      builder: (context, child) =>
          FlutterBreakpointProvider.builder(context: context, child: child),
      routes: {
        '/welcome': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignupPage(),
        '/verify': (_) => const VerifyPage(),
        '/home': (_) => const HomePage()
      },
    );
  }
}
