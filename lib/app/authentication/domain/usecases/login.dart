import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/app/authentication/domain/repositories/repositories.dart';
import 'package:alex_messenger/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login {
  const Login({required this.repositories});
  final Repositories repositories;

  Future<Either<Failure, User>> call(Account account) async {
    if(account.email.isEmpty) {
      return const Left(Failure(message: 'Email is empty'));
    }
    if(account.password.isEmpty) {
      return const Left(Failure(message: 'Password is empty'));
    }
    return await repositories.login(account.email, account.password);
  }
}