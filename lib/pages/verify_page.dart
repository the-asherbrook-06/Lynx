// Packages
import 'package:flutter_breakpoints/flutter_breakpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

// Providers
import 'package:lynx/provider/brightness_provider.dart';
import 'package:lynx/provider/auth_provider.dart';

class VerifyPage extends ConsumerWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = Breakpoints.tablet.isBreakpoint(context);
    final isDesktop = Breakpoints.desktop.isBreakpoint(context);
    final isLargeDesktop = Breakpoints.largeDesktop.isBreakpoint(context);

    final isCooldown = ref.watch(resendCooldownProvider);
    final brightness = ref.watch(brightnessProvider);

    return Scaffold(
      appBar: (isDesktop || isLargeDesktop)
          ? null
          : AppBar(
              leading: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Are you sure?"),
                      content: const Text(
                        "You need to verify your email to continue. "
                        "You can verify it later from login.",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Stay"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context, '/welcome', (_) => false);
                          },
                          child: const Text("Leave"),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(HugeIconsStroke.arrowLeft01),
              ),
              centerTitle: false,
              title: Text("Verify Email"),
            ),
      body: Padding(
        padding: const EdgeInsets.all(8),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isDesktop || isLargeDesktop)
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: const Text("Are you sure?"),
                              content: const Text(
                                "You need to verify your email to continue. "
                                "You can verify it later from login.",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Stay"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Leave"),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icon(HugeIconsStroke.arrowLeft01),
                      ),
                      const SizedBox(width: 8),
                      Text("Verify Email", style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                const SizedBox(height: 40),
                SvgPicture.asset('assets/$brightness/message_sent.svg', height: 200),
                const SizedBox(height: 80),
                Text("Check your Mailbox!", style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(
                  "We have sent a link to verify your email.",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Check your spam folder if you don't hear from us for a while",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Expanded(child: SizedBox()),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: isCooldown
                        ? null
                        : () async {
                            final user = ref.read(firebaseUserProvider);
                            await user?.sendEmailVerification();

                            ref.read(resendCooldownProvider.notifier).state = true;

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Verification email resent")),
                            );

                            Future.delayed(const Duration(seconds: 30), () {
                              ref.read(resendCooldownProvider.notifier).state = false;
                            });
                          },
                    child: Text("Resend Verification Mail"),
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
                    onPressed: () async {
                      final user = ref.read(firebaseAuthProvider).currentUser;

                      if (user == null) return;

                      await user.reload();
                      final refreshedUser = ref.read(firebaseAuthProvider).currentUser;

                      if (refreshedUser?.emailVerified == true) {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (context) => false);
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text("Email not verified yet")));
                      }
                    },
                    child: Text("I have verified my Email"),
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
