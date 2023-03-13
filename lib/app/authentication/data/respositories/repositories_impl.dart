import 'package:alex_messenger/app/authentication/data/datasources/cache_data.dart';
import 'package:alex_messenger/app/authentication/data/datasources/remote_data.dart';
import 'package:alex_messenger/app/authentication/data/models/account.dart';
import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/app/authentication/domain/repositories/repositories.dart';
import 'package:alex_messenger/core/error/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alex_messenger/core/extension/string_extension.dart';
import 'package:dartz/dartz.dart';


class RepositoriesImpl extends Repositories {
  const RepositoriesImpl({required this.remoteData, required this.cacheData});
  final RemoteData remoteData;
  final CacheData cacheData;

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      cacheData.cacheAccount(AccountModal(email: email, password: password));
      return Right(await remoteData.login(email, password));
    } on FirebaseAuthException catch(e) {
      return Left(Failure(message: ' '.join(e.code.split(RegExp(r'[-]'))).caption()));
    }
  }

  @override
  Future<Failure?> signup(String email, String password) async {
    try {
      await remoteData.signup(email, password).then((value) {
        remoteData.sendEmailVerification();
        cacheData.cacheAccount(AccountModal(email: email, password: password));
      });
    } on FirebaseAuthException catch(e) {
      return Failure(message: ' '.join(e.code.split(RegExp(r'[-]'))).caption());
    }
    return null;
  }

  @override
  Account getAccount() {
    return cacheData.getAccount();
  }

}