import 'package:debutapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

/*
* The UI will depend on the Status to decide which screen/action to be done.
* - Uninitialized - Checking user is logged or not, the Splash Screen will be shown
* - Authenticated - User is authenticated successfully, Home Page will be shown
* - Authenticating - Sign In button has just been pressed, progress bar will be shown
* - Unauthenticated - User is not authenticated, login page will be shown
 */
class AuthProvider extends ChangeNotifier {
  late FirebaseAuth _auth;

  // Default status
  Status _status = Status.Uninitialized;

  Status get status => _status;

  Stream<UserModel> get user =>
      _auth.authStateChanges().map(_createUserFromFirebaseUserModel);

  AuthProvider() {
    _auth = FirebaseAuth.instance;

    // listener for authentication changes such as user sign in and sign out
    _auth.authStateChanges().listen(handleOnAuthStateChanged);
  }

  // Create user object based on the given User
  UserModel _createUserFromFirebaseUserModel(User? firebaseUser) {
    if (firebaseUser == null) {
      return UserModel(uid: null);
    }

    return UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        displayName: firebaseUser.displayName);
  }

  // Method to detect live auth changes such as user sign in and sign out
  Future<void> handleOnAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _status = Status.Authenticated;
    }

    notifyListeners();
  }

  // Method to handle user sign in using email and password
  Future<bool> signInWithGoogle() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  // Method to handle user signing out
  Future signOut() async {
    _auth.signOut();

    _status = Status.Unauthenticated;
    notifyListeners();

    return Future.delayed(Duration.zero);
  }
}
