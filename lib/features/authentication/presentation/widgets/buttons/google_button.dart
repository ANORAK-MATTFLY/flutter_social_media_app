import 'package:flutter/material.dart';
import 'package:talk/features/authentication/domain/logic/authentication/auth.dart';
import 'package:talk/features/authentication/presentation/widgets/icons/google_icon.dart';
import 'package:talk/features/authentication/presentation/widgets/social_button.dart';
import 'package:provider/provider.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        AuthHandler provider = Provider.of<AuthHandler>(context, listen: false);
        await provider.loginWithGoogle();
      },
      child: SocialButton(text: "Continue with Google", socialIcon: googleIcon),
    );
  }
}
