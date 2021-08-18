import 'package:talk/features/authentication/domain/interfaces/user_interface.dart';
import 'package:talk/features/authentication/infrastructur/model/user_model.dart';
import 'package:talk/features/common/firebase/info.dart';

class UserLogic extends UserInterface {
  deleteUser() async {
    await FirebaseInfo.useCollection.doc(FirebaseInfo.currentUserID).get();
  }

  updateUserProfilePicture(String image) async {
    await FirebaseInfo.useCollection.doc(FirebaseInfo.currentUserID).update({
      "photoUrl": image,
    });
  }

  updateProfileBanner(String userID, String imageUrl) async {
    await FirebaseInfo.useCollection
        .doc(userID)
        .update({"imageBanner": imageUrl});
  }

  updateUserName(String userName) async {
    await FirebaseInfo.useCollection.doc(FirebaseInfo.currentUserID).update({
      "displayName": userName,
    });
  }

  updateUserBio(String bio) async {
    await FirebaseInfo.useCollection.doc(FirebaseInfo.currentUserID).update({
      "bio": bio,
    });
  }

  getCurrentUser(String userID) async {
    final remoteUserData = await FirebaseInfo.useCollection.doc(userID).get();
    final currentUserData = UserModel.fromDocument(remoteUserData);
    return currentUserData;
  }
}
