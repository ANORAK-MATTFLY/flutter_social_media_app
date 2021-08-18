import 'package:talk/features/authentication/domain/interfaces/user_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLogic extends UserInterface {
  final CollectionReference _useCollection =
      FirebaseFirestore.instance.collection("users");

  final String currentUserID =
      FirebaseAuth.instance.currentUser!.providerData[0].uid!;

  getUsers() async {
    final users = await _useCollection.doc().get();
    return users;
  }

  getCurrentUser() async {
    final userData = await _useCollection.doc(currentUserID).get();
    return userData;
  }
}
