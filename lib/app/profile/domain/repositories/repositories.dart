import 'package:alex_messenger/app/profile/domain/entities/user_info.dart';
import 'package:alex_messenger/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class Repositories {
  const Repositories();
  Future<Either<Failure, UserInfoEntity>> getUserInfo();
}