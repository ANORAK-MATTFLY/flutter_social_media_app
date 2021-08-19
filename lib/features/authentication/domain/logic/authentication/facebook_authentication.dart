import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:talk/features/common/firebase/info.dart';

class FacebookAuthentication with ChangeNotifier {
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    // Once signed in, return the UserCredential
    UserCredential useauth = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    final fbUser = useauth.user!.providerData[0];

    createNewUser(fbUser);

    return useauth;
  }

  void createNewUser(UserInfo user) async {
    DocumentSnapshot userInDocument =
        await FirebaseInfo.usersCollection.doc(user.uid).get();
    if (!userInDocument.exists) {
      create(user);
      userInDocument = await FirebaseInfo.usersCollection.doc(user.uid).get();
    }
  }

  void create(UserInfo user) async {
    try {
      registerUser(user);
    } catch (error) {
      throw error;
    }
  }

  void registerUser(UserInfo user) async {
    await FirebaseInfo.usersCollection.doc(user.uid).set(
      {
        "id": user.uid,
        "email": user.email,
        "displayName": user.displayName,
        "photoUrl": user.photoURL != null
            ? user.photoURL
            : "https://gravatar.com/avatar/a82f586840fe841a3457f00afa8e7a52.png?s=272&d=retro",
        "userDeviceId": "",
        "bio": "",
        "imageBanner": "",
        "favoriteTopics": [],
        "followers": [],
        "following": [],
        "lastSeen": Timestamp.now(),
      },
    );
  }
}
