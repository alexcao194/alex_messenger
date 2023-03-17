class UserInfoEntity {
  const UserInfoEntity({
    required this.displayName,
    required this.birthday,
    required this.gender,
    required this.photo,
    required this.cover,
    required this.friends
  });
  final String displayName;
  final String birthday;
  final bool gender;
  final String photo;
  final String cover;
  final int friends;
}