import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/core/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

abstract class Repositories {
  const Repositories();
  Future<Either<Failure, User>> login(String email, String password);
  Future<Failure?> signup(String email, String password);
  Account getAccount();
}