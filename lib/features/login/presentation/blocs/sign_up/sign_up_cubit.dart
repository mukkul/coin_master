import 'package:coin_master/features/login/domain/usecases/sign_up_usecase.dart';
import 'package:coin_master/features/login/domain/value_objects/email.dart';
import 'package:coin_master/features/login/domain/value_objects/password.dart';
import 'package:coin_master/features/login/presentation/blocs/email_status.dart';
import 'package:coin_master/features/login/presentation/blocs/form_status.dart';
import 'package:coin_master/features/login/presentation/blocs/obscure_password.dart';
import 'package:coin_master/features/login/presentation/blocs/password_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit({required SignUpUseCase signUpUseCase})
      : _signUpUseCase = signUpUseCase,
        super(const SignUpState.initial());

  void emailChanged(String value) {
    try {
      Email email = Email((p0) => p0.value = value);
      emit(state.copyWith(
        email: email,
        emailStatus: EmailStatus.valid,
      ));
    } on ArgumentError {
      emit(state.copyWith(emailStatus: EmailStatus.invalid));
    }
  }

  void passwordChanged(String value) {
    try {
      Password password = Password(
        (p0) => p0.value = value,
      );
      emit(state.copyWith(
        password: password,
        passwordStatus: PasswordStatus.valid,
      ));
    } on ArgumentError {
      emit(state.copyWith(passwordStatus: PasswordStatus.invalid));
    }
  }

  Future<void> resetEmailInput() async {
    emit(
      state.copyWith(
        emailStatus: EmailStatus.unknown,
      )
    );
  }

  Future<void> resetPasswordInput() async {
    emit(
      state.copyWith(
        passwordStatus: PasswordStatus.unknown,
      )
    );
  }

  void obscurePassword() {
    emit(state.copyWith(
      obscurePassword: state.obscurePassword == ObscurePassword.no
          ? ObscurePassword.yes
          : ObscurePassword.no
    ));
  }

  Future<void> signUp() async {
    if(!(state.emailStatus == EmailStatus.valid) ||
      !(state.passwordStatus == PasswordStatus.valid)
    ){
      emit(state.copyWith(formStatus: FormStatus.invalid));
      emit(state.copyWith(formStatus: FormStatus.initial));
      return;
    }
    emit(state.copyWith(formStatus: FormStatus.submissionInProgress));
    try{
      await _signUpUseCase(
        SignUpParams(
          email: state.email!,
          password: state.password!,
        )
      );
      emit(state.copyWith(formStatus: FormStatus.submissionSuccess));
    }catch (e){
      emit(state.copyWith(formStatus: FormStatus.submissionFailure));
    }
  }
}
