import 'dart:async';

import 'package:coin_master/constants/instance_constants.dart';
import 'package:coin_master/extensions/extensions_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isLoading = false;
  bool _redirecting = false;
  late final TextEditingController _emailController;
  late final StreamSubscription<AuthState> _authStateSubscription;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signInWithOtp(
        email: _emailController.text.trim(),
        emailRedirectTo:
            kIsWeb ? null : 'io.supabase.flutterquickstart://login-callback/',
      );
      if (mounted) {
        context.showSnackBar(message: 'Check you email for login link!');
        _emailController.clear();
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(error: error.message);
    } catch (error) {
      context.showErrorSnackBar(error: 'Unexpected error occured!');
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _googleSignIn() async {
    try {
      supabase.auth.signInWithOAuth(
        Provider.google,
        redirectTo: 'https://fllygxnwqnkctowzmxhq.supabase.co/auth/v1/callback',
      );
    } on AuthException catch (error) {
      debugPrint('auth error: ${error.message}');
      context.showErrorSnackBar(error: error.message);
    } catch (error) {
      debugPrint('auth error: $error');
      context.showErrorSnackBar(error: error.toString());
    }
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((event) {
      if (_redirecting) return;
      final session = event.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/profile');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _authStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      children: [
        const Text('Sign in with magic link with your email below'),
        const SizedBox(
          height: 18,
        ),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _signIn,
          child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _googleSignIn,
          child: Text(_isLoading ? 'Loading' : 'Google Sign In'),
        ),
      ],
    ));
  }
}
