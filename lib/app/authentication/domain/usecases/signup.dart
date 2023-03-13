import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/app/authentication/domain/repositories/repositories.dart';
import 'package:alex_messenger/core/error/failures.dart';


class Signup {
  const Signup({required this.repositories});
  final Repositories repositories;

  Future<Failure?> call(Account account) async {
    if(account.email.isEmpty) {
      return const Failure(message: 'Email is empty');
    }
    if(account.password != account.rePassword) {
      return const Failure(message: 'Password is not match');
    }
    if(account.password.isEmpty) {
      return const Failure(message: 'Password is empty');
    }
   return await repositories.signup(account.email, account.password);
  }
}
