import 'package:coin_master/domain/auth/auth_failure.dart';
import 'package:coin_master/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password
  });
  
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
