import 'package:built_value/built_value.dart';
import 'package:coin_master/constants/error_messages/error_messages.dart';
import 'package:email_validator/email_validator.dart';

part 'email.g.dart';

abstract class Email implements Built<Email, EmailBuilder> {
  String get value;

  Email._() {
    if (EmailValidator.validate(value) == false) {
      throw ArgumentError(ErrorMessages.invalidEmailError);
    }
  }

  factory Email([void Function(EmailBuilder) updates]) = _$Email;
}
