// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter/material.dart';

// Provider
import 'package:lynx/provider/auth_provider.dart';

final signupControllerProvider = StateNotifierProvider<SignupController, SignupState>((ref) {
  return SignupController(ref);
});

class SignupState {
  final bool obscurePassword;
  final bool obscureRepeatPassword;
  final bool isLoading;

  const SignupState({
    this.obscurePassword = true,
    this.obscureRepeatPassword = true,
    this.isLoading = false,
  });

  SignupState copyWith({bool? obscurePassword, bool? obscureRepeatPassword, bool? isLoading}) {
    return SignupState(
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureRepeatPassword: obscureRepeatPassword ?? this.obscureRepeatPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class SignupController extends StateNotifier<SignupState> {
  SignupController(this.ref) : super(const SignupState());

  final Ref ref;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  void togglePasswordVisibility() {
    state = state.copyWith(obscurePassword: !state.obscurePassword);
  }

  void toggleRepeatPasswordVisibility() {
    state = state.copyWith(obscureRepeatPassword: !state.obscureRepeatPassword);
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;

    state = state.copyWith(isLoading: true);

    try {
      await ref
          .read(authControllerProvider.notifier)
          .signUp(
            name: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }
}
