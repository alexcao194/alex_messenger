import 'package:alex_messenger/app/profile/data/datasources/remote_data.dart';
import 'package:alex_messenger/app/profile/domain/entities/user_info.dart';
import 'package:alex_messenger/app/profile/domain/repositories/repositories.dart';
import 'package:alex_messenger/core/error/failures.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class RepositoriesImpl extends Repositories {
  const RepositoriesImpl({required this.remoteData});
  final RemoteData remoteData;
  @override
  Future<Either<Failure, UserInfoEntity>> getUserInfo() async {
    try {
      return Right(await remoteData.getInfo());
    } on FirebaseException catch(e) {
      return Left(Failure(message: e.code));
    }
  }
}