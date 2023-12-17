part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final Email? email;
  final Password? password;
  final EmailStatus emailStatus;
  final PasswordStatus passwordStatus;
  final FormStatus formStatus;
  final ObscurePassword obscurePassword;

  const SignUpState({
    this.email,
    this.password,
    this.emailStatus = EmailStatus.unknown,
    this.passwordStatus = PasswordStatus.unknown,
    this.formStatus = FormStatus.initial,
    this.obscurePassword = ObscurePassword.yes,
  });

  @override
  List<Object?> get props => [email, password, emailStatus, passwordStatus, formStatus, obscurePassword];
  

  const SignUpState.initial() : this();

  SignUpState copyWith({
    Email? email,
    Password? password,
    EmailStatus? emailStatus,
    PasswordStatus? passwordStatus,
    FormStatus? formStatus,
    ObscurePassword? obscurePassword,
  }) {
    return SignUpState(
      email: email??this.email,
      password: password??this.password,
      emailStatus: emailStatus??this.emailStatus,
      passwordStatus: passwordStatus??this.passwordStatus,
      formStatus: formStatus??this.formStatus,
      obscurePassword: obscurePassword??this.obscurePassword,
    );
  }
}
