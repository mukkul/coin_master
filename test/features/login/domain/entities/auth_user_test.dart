import 'dart:math';

import 'package:coin_master/features/login/domain/entities/auth_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Empty auth user had correct default values', () {
    expect(AuthUser.empty.id, equals(''));
    expect(AuthUser.empty.email, equals(''));
    expect(AuthUser.empty.photoUrl, equals(''));
    expect(AuthUser.empty.name, equals(''));
  });

  test('two auth user instance with same values are equal', () {
    const user1 = AuthUser(
      id: 'id', email: 'email', name: 'name', photoUrl: 'photoUrl',
    );
    const user2 = AuthUser(
      id: 'id', email: 'email', name: 'name', photoUrl: 'photoUrl',
    );
    expect(user1, equals(user2));
  });

  test('two AuthUser instances with different values are not equal', () {
    const user1 = AuthUser(
      id: 'id1',
      email: 'email',
      name: 'name',
      photoUrl: 'photoURL',
    );
    const user2 = AuthUser(
      id: 'id2',
      email: 'email',
      name: 'name',
      photoUrl: 'photoURL',
    );
    expect(user1, isNot(equals(user2)));
  });

  test('Props return correct properties', () {
    const user = AuthUser(id: 'id', email: 'email', name: 'name', photoUrl: 'photoUrl');
    expect(user.props, equals(['id','email','name','photoUrl']));
  });

  test('name and photoUrl can be null', (){
    const user = AuthUser(id: 'id', email: 'email');
    expect(user.name, isNull);
    expect(user.photoUrl, isNull);
  });
}