// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:lynx/provider/auth_provider.dart';

final loginControllerProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});

class LoginState {
  final bool obscurePassword;
  final bool isLoading;

  const LoginState({this.obscurePassword = true, this.isLoading = false});

  LoginState copyWith({bool? obscurePassword, bool? isLoading}) {
    return LoginState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginState());

  final Ref ref;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  Future<void> login(BuildContext context) async {
    state = state.copyWith(isLoading: true);

    try {
      await ref
          .read(authControllerProvider.notifier)
          .login(email: emailController.text.trim(), password: passwordController.text.trim());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
