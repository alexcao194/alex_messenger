import 'package:alex_messenger/app/authentication/domain/entities/account.dart';

class AccountModal extends Account {
  const AccountModal({
    required super.password,
    required super.email,
    super.rePassword
});

  factory AccountModal.fromJson(Map<String, dynamic> json) {
    return AccountModal(
      password: json['password'],
      email: json['email'],
      rePassword: json['re-password']
    );
  }

  static Map<String, dynamic> toJson(AccountModal accountModal) {
    return {
      'email' : accountModal.email,
      'password' : accountModal.password,
      're-password' : accountModal.rePassword
    };
  }
}