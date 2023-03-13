import 'package:firebase_auth/firebase_auth.dart';

abstract class RemoteData {
  const RemoteData();
  Future<void> sendEmailVerification();
  Future<void> signup(String email, String password);
  Future<User> login(String email, String password);
}

class RemoteDataImpl extends RemoteData {
  final authenticator = FirebaseAuth.instance;

  @override
  Future<User> login(String email, String password) async {
    try {
      var userCredential = await authenticator.signInWithEmailAndPassword(
          email: email,
          password: password
      ).timeout(
        const Duration(milliseconds: 5000),
        onTimeout: () {
          throw FirebaseAuthException(code: 'no-internet-connection');
        },
      );
      if(userCredential.user != null) {
        if(userCredential.user!.emailVerified) {
          return userCredential.user!;
        } else {
          throw FirebaseAuthException(code: 'user-has-never-been-verified');
        }
      } else {
        throw FirebaseAuthException(code: 'unknown');
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      await authenticator.currentUser!.sendEmailVerification().then((value) {
        authenticator.signOut();
      });
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  @override
  Future<void> signup(String email, String password) async {
    try {
      await authenticator.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }
}