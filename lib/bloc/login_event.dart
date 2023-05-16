abstract class LoginEvent {}

class InitialEvent extends LoginEvent {}

class VerifyEvent extends LoginEvent {}

class SendOTPEveny extends LoginEvent {}

class OTPSentEvent extends LoginEvent {}

class OTPFailedEvent extends LoginEvent {}