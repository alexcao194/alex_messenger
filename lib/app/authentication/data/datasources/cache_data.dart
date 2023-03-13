import 'dart:convert';

import 'package:alex_messenger/app/authentication/data/models/account.dart';
import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheData {
  const CacheData();
  void cacheAccount(AccountModal account);
  Account getAccount();
}

class CacheDataImpl extends CacheData {
  const CacheDataImpl({required this.sharedPreferences});
  final String _cacheAccountKey = 'cache-account-key';

  final SharedPreferences sharedPreferences;

  @override
  void cacheAccount(AccountModal account) async {
    await sharedPreferences.setString(_cacheAccountKey, json.encode(AccountModal.toJson(account)));
  }

  @override
  Account getAccount() {
    String? accountData = sharedPreferences.getString(_cacheAccountKey);
    if(accountData == null) {
      return const AccountModal(password: '', email: '');
    }
    var accountJson = json.decode(accountData);
    return AccountModal.fromJson(accountJson);
  }
}