import 'package:alex_messenger/app/profile/domain/entities/user_info.dart';
import 'package:alex_messenger/app/profile/domain/repositories/repositories.dart';
import 'package:alex_messenger/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetInfo {
  const GetInfo({required this.repositories});
  final Repositories repositories;
  Future<Either<Failure, UserInfoEntity>> call() async {
    return await repositories.getUserInfo();
  }
}