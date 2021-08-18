import 'package:talk/features/authentication/infrastructur/data_sources/remote_data_source.dart';

class UserRepository {
  Future getUsertData(bool hasInternet) async {
    if (hasInternet) {
      await UserRemoteDataSource.getCurrentUser();
    } else {
      return "No internet";
    }
  }
}
