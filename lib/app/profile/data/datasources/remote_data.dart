import 'package:alex_messenger/app/profile/data/models/user_info.dart';
import 'package:alex_messenger/app/profile/domain/entities/user_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
enum UserField {
  displayName,
  birthday
}

abstract class RemoteData {
  const RemoteData();

  Future<UserInfoEntity> getInfo();
  void updateInfo(Map<UserField, dynamic> info);
}

class RemoteDataImpl extends RemoteData {
  @override
  Future<UserInfoEntity> getInfo() async {
    var user = FirebaseAuth.instance.currentUser;
    if(user == null) {
      throw FirebaseException(code: 'user-is-not-logged-in', plugin: 'fire-store');
    }
    var snapshot = await FirebaseFirestore.instance.collection('user').doc(user.email).get().timeout(
        const Duration(seconds: 10),
      onTimeout: () {
        throw FirebaseException(plugin: 'fire-store', code: 'unknown');
      }
    );
    if(snapshot.data() == null) {
      throw FirebaseException(plugin: 'fire-store', code: 'unknown');
    }
    return UserInfoModal.fromJson(snapshot.data()!);
  }

  @override
  void updateInfo(Map<UserField, dynamic> info) {
    var user = FirebaseAuth.instance.currentUser;
    if(user == null) {
      throw FirebaseAuthException(code: 'user-is-not-logged-in');
    }
    for(var field in info.keys) {
      switch(field) {
        case UserField.displayName:
            //
          break;
        case UserField.birthday:
            // TODO: handle
          break;
      }
    }
  }

}