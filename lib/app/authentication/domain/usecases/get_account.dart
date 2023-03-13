import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/app/authentication/domain/repositories/repositories.dart';

class GetAccount {
  const GetAccount({required this.repositories});
  final Repositories repositories;

  Account call() {
    return repositories.getAccount();
  }
}