class Account {
  const Account({required this.email, required this.password, this.rePassword});
  
  final String email;
  final String password;
  final String? rePassword;
}