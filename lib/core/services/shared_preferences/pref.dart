import 'dart:convert';

import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static const String _cacheAccountKey = 'cache-account-key';

  static void cacheAccount(Account account) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString(_cacheAccountKey, json.encode(account));
  }

  static Future<void> getAccount() async {
    var pref = await SharedPreferences.getInstance();
    var accountJson = pref.getString(_cacheAccountKey);
    print(accountJson);
  }
}