import 'dart:async';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Param> {
  Future<Type> call(Param params);
}

abstract class Params extends Equatable {
  @override
  List<Object?> get props => [];
}

class NoParams extends Params{}
