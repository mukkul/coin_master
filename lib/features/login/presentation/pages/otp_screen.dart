import 'package:coin_master/features/presentation/screens/dashboard/home_screen.dart';
import 'package:coin_master/features/login/presentation/blocs/sign_in/sign_in_cubit.dart';
import 'package:coin_master/utils/localization/localization_util.dart';
import 'package:coin_master/utils/service_locator.dart';
import 'package:coin_master/widgets/buttons.dart';
import 'package:coin_master/widgets/input_field.dart';
import 'package:coin_master/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => serviceLocator<SignInCubit>(),
      child: const OTPWidget(),
    );
  }
}

class OTPWidget extends StatefulWidget {
  const OTPWidget({super.key});

  @override
  State<OTPWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<OTPWidget> {
  late final TextEditingController _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignInCubit, SignInState>(
        listener: (BuildContext context, SignInState state) {},
        builder: (BuildContext context, SignInState state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputField.digitOnly(
                    textEditingController: _otpController,
                   
                      hintText: LocalizationUtil.getTranslatedString(
                        'enterOTP',
                      ),
                   
                  ),
                  Buttons.primary(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HomeScreen(),
                        ),
                      );
                    },
                    child: LabelText(
                      label: LocalizationUtil.getTranslatedString(
                        'verifyOTP',
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
