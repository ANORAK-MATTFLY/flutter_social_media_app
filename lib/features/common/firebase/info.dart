import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseInfo {
  static CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  static String currentUserID =
      FirebaseAuth.instance.currentUser!.providerData[0].uid!;
}
