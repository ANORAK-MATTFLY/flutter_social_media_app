import 'package:flutter/material.dart';
import 'package:talk/features/authentication/application/authentication_facade.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:talk/features/authentication/presentation/widgets/icons/google_icon.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        AuthenticationFacade provider =
            Provider.of<AuthenticationFacade>(context, listen: false);
        await provider.loginWithGoogle();
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
            googleIcon,
            Text(
              "Continue with Google",
              style: GoogleFonts.quicksand(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
