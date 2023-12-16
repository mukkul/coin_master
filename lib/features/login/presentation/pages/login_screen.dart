import 'dart:async';

import 'package:coin_master/controllers/login_controllers/login_controller.dart';
import 'package:coin_master/features/login/presentation/blocs/email_status.dart';
import 'package:coin_master/features/login/presentation/blocs/form_status.dart';
import 'package:coin_master/features/login/presentation/blocs/password_status.dart';
import 'package:coin_master/features/login/presentation/blocs/sign_in/sign_in_cubit.dart';
import 'package:coin_master/utils/localization/localization_util.dart';
import 'package:coin_master/utils/service_locator.dart';
import 'package:coin_master/widgets/buttons.dart';
import 'package:coin_master/widgets/label_text.dart';
import 'package:coin_master/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => serviceLocator<SignInCubit>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({key = const Key('_signInView_key')}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (BuildContext context, SignInState state) {
          if (state.formStatus == FormStatus.submissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text(
                    'There was an error with the sign up process. Try again.'),
              ));
          }
          if (state.formStatus == FormStatus.invalid) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text('Invalid form: please fill in all fields'),
              ));
          }
        },
        builder: (BuildContext context, SignInState state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormFieldWidget(
                    key: const Key('signIn_emailInput_textField'),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    preffixIcon: const Icon(Icons.email),
                    suffixIcon: state.emailStatus == EmailStatus.unknown
                        ? null
                        : IconButton(
                            key: const Key('signIn_emailInput_iconButton'),
                            icon: const Icon(Icons.clear),
                            onPressed: clearTextEmail,
                          ),
                    labelText: 'Email',
                    errorText: state.emailStatus == EmailStatus.invalid
                        ? 'Invalid Email'
                        : null,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        context.read<SignInCubit>().resetEmailInput();
                        return;
                      }
                      if (debounce?.isActive ?? false) {
                        debounce?.cancel();
                      }
                      debounce = Timer(const Duration(milliseconds: 500), () {
                        context.read<SignInCubit>().emailChanged(value);
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormFieldWidget(
                    key: const Key('signIn_passwordInput_textField'),
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: true,
                    preffixIcon: const Icon(Icons.key),
                    suffixIcon: state.passwordStatus == PasswordStatus.unknown
                        ? null
                        : IconButton(
                            key: const Key('signIn_passwordInput_iconButton'),
                            icon: const Icon(Icons.clear),
                            onPressed: clearTextPassword,
                          ),
                    labelText: 'Password',
                    onChanged: (value) {
                      if (value.isEmpty) {
                        context.read<SignInCubit>().resetPasswordInput();
                        return;
                      }
                      context.read<SignInCubit>().passwordChanged(value);
                    },
                  ),
                  ElevatedButton(
                    key: const Key('signIn_continue_elevatedButton'),
                    onPressed:
                        state.formStatus == FormStatus.submissionInProgress
                            ? null
                            : () {
                                context.read<SignInCubit>().signIn();
                              },
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextButton(
                      key: const Key('go_to_signUp_continue_textButton'),
                      onPressed: () {
                        context.goNamed('sign-up');
                      },
                      child: const Text('Sign Up')),
                  Buttons.primary(
                    onPressed: () async =>
                        await LoginController.signInWithGoogle(
                      context: context,
                    ),
                    child: LabelText(
                      label: LocalizationUtil.getTranslatedString(
                        'loginWithGoogle',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void clearTextEmail() {
    context.read<SignInCubit>().resetEmailInput();
    emailController.clear();
  }

  void clearTextPassword() {
    context.read<SignInCubit>().resetPasswordInput();
    passwordController.clear();
  }
}
