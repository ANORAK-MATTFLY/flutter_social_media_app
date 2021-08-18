import 'package:cloud_firestore/cloud_firestore.dart';

abstract class UserInterface {
  Future<DocumentSnapshot<Object?>> getUsers();
  Future<DocumentSnapshot<Object?>> getCurrentUser();
}
