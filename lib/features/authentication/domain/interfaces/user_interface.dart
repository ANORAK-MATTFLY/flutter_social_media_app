import 'package:talk/features/authentication/infrastructur/model/user_model.dart';

abstract class UserInterface {
  Future<void> deleteUser();

  Future<void> updateUserProfilePicture(String image);

  Future<void> updateProfileBanner(String userID, String imageUrl);

  Future<void> updateUserName(String userName);

  Future<void> updateUserBio(String bio);

  Future<UserModel> getCurrentUser(String userID);
}
