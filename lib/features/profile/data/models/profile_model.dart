import 'package:school_app/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.username,
    required super.address,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json['id']?.toString() ?? '',
    username: json['username'] as String? ?? '',
    address: json['address'] as String? ?? '',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'address': address,
  };
}
