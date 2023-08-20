import 'package:coin_master/bloc/login_barrel.dart';
import 'package:coin_master/controllers/login_controllers/login_controller.dart';
import 'package:coin_master/screens/login_screens/otp_screen.dart';
import 'package:coin_master/utils/localization/localization_util.dart';
import 'package:coin_master/widgets/button.dart';
import 'package:coin_master/widgets/input_field.dart';
import 'package:coin_master/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(InitialState()),
      child: const LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {},
        builder: (BuildContext context, LoginState state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputField.digitOnly(
                    textEditingController: _phoneController,
                      hintText: LocalizationUtil.getTranslatedString(
                        'enterMobileNumber',
                      ),
                  ),
                  Buttons.primary(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const OTPScreen()),
                      );
                    },
                    child: LabelText(
                      label: LocalizationUtil.getTranslatedString(
                        'getOTP',
                      ),
                    ),
                  ),
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
}
