// packages
import 'package:flutter/material.dart';

// themes
import 'package:lynx/theme/theme.dart';
import 'package:lynx/theme/util.dart';

void main() {
  runApp(const Lynx());
}

class Lynx extends StatelessWidget {
  const Lynx({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Livvic", "Raleway");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      theme: theme.light(),
      darkTheme: theme.dark(),
    );
  }
}