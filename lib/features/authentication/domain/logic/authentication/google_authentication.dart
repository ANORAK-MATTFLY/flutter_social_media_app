import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthentication extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  GoogleSignIn googleSignIn = GoogleSignIn();

  bool? _isSigningIn;

  GoogleAuthentication() {
    _isSigningIn = false;
  }

  bool? get isSigningIn => _isSigningIn;

  set isSigningIn(bool? isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future loginWithGoogle() async {
    _isSigningIn = true;
    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
    GoogleSignInAccount currentUser = googleSignIn.currentUser!;
    createNewUser(currentUser);
  }

  logout() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
  }

  void createNewUser(GoogleSignInAccount currentUser) async {
    DocumentSnapshot userInDocument =
        await usersCollection.doc(currentUser.id).get();
    if (!userInDocument.exists) {
      create(currentUser);
      userInDocument = await usersCollection.doc(currentUser.id).get();
    }
  }

  void create(GoogleSignInAccount user) async {
    try {
      registerUser(user);
    } catch (error) {
      print(error);
    }
  }

  void registerUser(GoogleSignInAccount user) async {
    await usersCollection.doc(user.id).set(
      {
        "id": user.id,
        "email": user.email,
        "displayName": user.displayName,
        "photoUrl": user.photoUrl != null
            ? user.photoUrl
            : "https://gravatar.com/avatar/a82f586840fe841a3457f00afa8e7a52.png?s=272&d=retro",
        "userDeviceToken": "",
        "bio": "",
        "imageBanner": "",
        "followers": [],
        "following": [],
        "lastSeen": Timestamp.now(),
      },
    );
  }
}
