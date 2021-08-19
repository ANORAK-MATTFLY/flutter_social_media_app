import 'package:talk/features/authentication/domain/logic/user_logic.dart';
import 'package:talk/features/authentication/infrastructur/repository/user_repository.dart';

class UserFacade extends UserLogic {
  UserRepository? userRepository;
  UserFacade({
    this.userRepository,
  });
  Future getCurrentUser(bool hasInternet) async {
    return userRepository!.getUsertData(hasInternet);
  }
}
