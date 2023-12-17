import 'package:coin_master/features/login/domain/entities/auth_user.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

//MODELS MUST TAKE DATA FROM DATASOURCE AND CONVERT TO ENTITY
class AuthUserModel extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;
  const AuthUserModel({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
  });

  factory AuthUserModel.fromFirebaseAuthUser(firebase_auth.User firebaseUser) {
    return AuthUserModel(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        name: firebaseUser.displayName,
        photoUrl: firebaseUser.photoURL);
  }

  AuthUser toEntity() {
    return AuthUser(
      id: id,
      email: email,
      name: name,
      photoUrl: photoUrl,
    );
  }

  @override
  List<Object?> get props => [id, email, name, photoUrl];
}
