import 'package:alex_messenger/app/profile/domain/entities/user_info.dart';

class UserInfoModal extends UserInfoEntity {
  UserInfoModal({
    required super.displayName,
    required super.birthday,
    required super.gender,
    required super.photo,
    required super.cover,
    required super.friends
  });

  factory UserInfoModal.fromJson(Map<String, dynamic> json) {
    return UserInfoModal(
      displayName: json['display-name'],
      birthday: json['birthday'],
      gender: json['gender'],
      photo: json['photo'],
      cover: json['cover'],
      friends: json['friends']
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'display-name' : displayName,
      'birthday' : birthday,
      'gender' : gender,
      'photo' : photo,
      'cover' : cover,
      'friends' : friends
    };
  }
}