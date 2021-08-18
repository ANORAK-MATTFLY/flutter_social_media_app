import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:talk/features/common/firebase/info.dart';

class UserRemoteDataSource {
  Future<DocumentSnapshot<Object?>> getUsers() async {
    final users = await FirebaseInfo.useCollection.doc().get();
    return users;
  }
}
