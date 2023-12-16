import 'package:coin_master/core/failures.dart';
import 'package:coin_master/core/value_objects.dart';
import 'package:coin_master/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class EmailAddress extends ValueObjects<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}


class Password extends ValueObjects<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}


