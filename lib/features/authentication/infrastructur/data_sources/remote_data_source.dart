import 'package:talk/features/authentication/infrastructur/model/user_model.dart';
import 'package:talk/features/common/firebase/info.dart';

class UserRemoteDataSource {
  static Future<UserModel> getCurrentUser() async {
    final remoteUserData = await FirebaseInfo.usersCollection
        .doc(FirebaseInfo.currentUserID)
        .get();
    final currentUserData = UserModel.fromDocument(remoteUserData);
    return currentUserData;
  }
}
