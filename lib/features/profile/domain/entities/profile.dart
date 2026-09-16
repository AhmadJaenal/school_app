import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.username,
    required this.address,
  });

  final String id;
  final String username;
  final String address;

  @override
  List<Object?> get props => [id, username, address];
}
