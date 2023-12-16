import 'dart:async';

import 'package:coin_master/features/login/presentation/blocs/email_status.dart';
import 'package:coin_master/features/login/presentation/blocs/form_status.dart';
import 'package:coin_master/features/login/presentation/blocs/obscure_password.dart';
import 'package:coin_master/features/login/presentation/blocs/password_status.dart';
import 'package:coin_master/features/login/presentation/blocs/sign_up/sign_up_cubit.dart';
import 'package:coin_master/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> serviceLocator<SignUpCubit>(),
      child: const SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  Timer? debounce;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    debounce?.cancel();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state){
          if(state.formStatus == FormStatus.invalid){
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text(
                      'Invalid form: Please fill in all fields',
                      style: TextStyle(
                        color: Colors.red.shade900,
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                  ),
                );
          }
          if(state.formStatus == FormStatus.submissionFailure){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    'There was an error with the sign up process. Try again.',
                    style: TextStyle(
                      color: Colors.red.shade900,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                ),
              );
          }
          if(state.formStatus == FormStatus.submissionSuccess){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    'Sign up successful',
                    style: TextStyle(
                      color: Colors.green.shade900,
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                ),
              );
            context.goNamed('home');
          }
        },
        builder: (context, state){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  key: const Key('signUp_emailInput_textField'),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: state.emailStatus == EmailStatus.unknown
                        ? null
                        : IconButton(
                      key: const Key('signUp_emailInput_iconButton'),
                      icon: const Icon(Icons.clear),
                      onPressed: clearEmailText,
                    ),
                    labelText: 'Email',
                    errorText: state.emailStatus == EmailStatus.invalid
                      ? 'Invalid email'
                      : null,
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      context.read<SignUpCubit>().resetEmailInput();
                      return;
                    }
                    if(debounce?.isActive ?? false){
                      debounce?.cancel();
                    }
                    debounce = Timer(const Duration(milliseconds: 1500), (){
                      context.read<SignUpCubit>().emailChanged(value);
                    });
                  },
                ),
                TextFormField(
                  key: const Key('signUp_passwordInput_textField'),
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  obscureText: state.obscurePassword == ObscurePassword.yes,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      key: const Key('obscure_passwordInput_iconButton'),
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: obscurePassword,
                    ),
                    labelText: 'Password',
                    errorText: state.passwordStatus == PasswordStatus.invalid
                        ? 'Invalid password'
                        : null,
                  ),
                  onChanged: (value){
                    if(value.isEmpty){
                      context.read<SignUpCubit>().resetPasswordInput();
                      return;
                    }
                    if(debounce?.isActive ?? false){
                      debounce?.cancel();
                    }
                    debounce = Timer(const Duration(milliseconds: 1500), (){
                      context.read<SignUpCubit>().passwordChanged(value);
                    });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                  key: const Key('signUp_continue_elevatedFormButton'),
                  onPressed: state.formStatus == FormStatus.submissionInProgress
                  ? null
                  : () {
                    context.read<SignUpCubit>().signUp();
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                TextButton(
                  key: const Key('go_to_signIn_continue_textButton'),
                  onPressed: (){
                    context.goNamed('login');
                  },
                  child: const Text('Go to sign In'),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void clearEmailText() {
    context.read<SignUpCubit>().resetEmailInput();
    emailController.clear();
  }

  void clearPasswordText() {
    context.read<SignUpCubit>().resetPasswordInput();
    passwordController.clear();
  }

  void obscurePassword(){
    context.read<SignUpCubit>().obscurePassword();
  }
}
