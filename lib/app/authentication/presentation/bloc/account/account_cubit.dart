import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/app/authentication/domain/usecases/get_account.dart';
import 'package:bloc/bloc.dart';

class AccountCubit extends Cubit<Account> {
  AccountCubit({required this.getAccount}) : super(const Account(email: '', password: ''));

  final GetAccount getAccount;

  void get() {
    emit(getAccount.call());
  }
}
