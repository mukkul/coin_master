import 'package:coin_master/bloc/login_barrel.dart';
import 'package:coin_master/controllers/login_controllers/login_controller.dart';
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
  @override
  void initState() {
    LoginController.phoneController = TextEditingController();
    LoginController.addListenerPhoneInput();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {},
        builder: (BuildContext context, LoginState state) {
          return Column(
            children: [
              LabelText(label: LocalizationUtil.getTranslatedString('enterMobileNumber'),),
              InputField.digitOnly(
                textEditingController: LoginController.phoneController,
              ),
              const Button.primary(onPressed: null),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    LoginController.phoneController.dispose();
    super.dispose();
  }
}
