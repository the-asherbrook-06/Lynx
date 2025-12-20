// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';

// Repositories
import 'package:lynx/repository/auth_repository.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firebaseUserProvider = Provider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(firebaseAuthProvider));
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.read(firebaseAuthProvider).authStateChanges();
});

final authControllerProvider = StateNotifierProvider<AuthController, AsyncValue<void>>(
  (ref) => AuthController(ref.read(authRepositoryProvider)),
);

final resendCooldownProvider = StateProvider<bool>((ref) {
  return false;
});

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _repo;

  AuthController(this._repo) : super(const AsyncData(null));

  // Sign Up
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    try {
      await _repo.signUp(email: email, password: password);
      await _repo.sendEmailVerification();
      state = const AsyncData(null);
    } on FirebaseAuthException catch (e, st) {
      if (e.code == 'email-already-in-use') {
        state = AsyncError('User already registered', st);
      } else {
        state = AsyncError(e.message ?? 'Signup failed', st);
      }
    } catch (e, st) {
      state = AsyncError(e.toString(), st);
    }
  }

  // Login
  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    try {
      await _repo.login(email: email, password: password);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  // OTP Verification
  Future<bool> checkEmailVerified() async {
    return await _repo.isEmailVerified();
  }

  // Logout
  Future<void> logout() async {
    await _repo.logout();
  }
}
