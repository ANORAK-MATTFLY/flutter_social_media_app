import 'package:talk/features/authentication/domain/logic/authentication/facebook_authentication.dart';
import 'package:talk/features/authentication/domain/logic/authentication/google_authentication.dart';

class AuthenticationFacade extends GoogleAuthentication {
  final FacebookAuthentication facebookAuthetication = FacebookAuthentication();
}
