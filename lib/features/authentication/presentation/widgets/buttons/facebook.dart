import 'package:flutter/material.dart';
import 'package:talk/features/authentication/application/authentication_facade.dart';
import 'package:talk/features/authentication/presentation/widgets/icons/facebook_icon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FacebookButton extends StatelessWidget {
  const FacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        AuthenticationFacade provider =
            Provider.of<AuthenticationFacade>(context, listen: false);
        await provider.facebookAuthetication.signInWithFacebook();
      },
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  side: BorderSide(color: Colors.white)))),
      child: FittedBox(
        child: Row(
          children: [
            facebookIcon,
            Text(
              "Continue with Facebook",
              style: GoogleFonts.quicksand(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
