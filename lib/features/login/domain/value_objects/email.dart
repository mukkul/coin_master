import 'package:built_value/built_value.dart';
import 'package:email_validator/email_validator.dart';

part 'email.g.dart';

abstract class Email implements Built<Email, EmailBuilder> {
  String get value;

  Email._() {
    if (EmailValidator.validate(value) == false) {
      throw ArgumentError('Invalid email format.');
    }
  }

  factory Email([void Function(EmailBuilder) updates]) = _$Email;
}
