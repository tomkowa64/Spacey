import 'package:firebase_auth/firebase_auth.dart';
import 'package:spacey/models/appUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user
  AppUser? _userFromFirebase(User? user) {
    return user != null ? AppUser(uid: user.uid, email: user.email) : null;
  }

  // auth change user stream
  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  // sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // register with email and password
  Future registerInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // change email and password
  Future changeEmailAndPassword(String email, String password) async {
    var user = _auth.currentUser;

    try{
      if(email.isNotEmpty) await user!.updateEmail(email);
      if(password.isNotEmpty) await user!.updatePassword(password);
      await signOut();
    } catch(e) {
      print(e.toString());
    }
    await signOut();
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}