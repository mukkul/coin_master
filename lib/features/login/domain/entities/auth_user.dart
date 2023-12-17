import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;
  const AuthUser({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  static const AuthUser empty =
      AuthUser(id: '', email: '', name: '', photoUrl: '');

  bool get isEmpty => this == AuthUser.empty;

  @override
  List<Object?> get props => [id, email, name, photoUrl];

  @override
  bool? get stringify => true;
}
