import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talk/features/authentication/presentation/pages/signup_screen.dart';
import 'package:talk/features/authentication/presentation/widgets/buttons/google_button.dart';
import 'package:talk/features/authentication/presentation/widgets/icons/facebook_icon.dart';
import 'package:talk/features/authentication/presentation/widgets/social_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordIsHiden = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: TextFormField(
              controller: password,
              obscureText: passwordIsHiden,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordIsHiden = !passwordIsHiden;
                    });
                  },
                  icon: passwordIsHiden
                      ? Icon(Icons.visibility, color: Colors.grey)
                      : Icon(Icons.visibility_off, color: Colors.grey),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          CupertinoButton.filled(
            onPressed: () async {},
            child: Text(
              "Continue",
              style: GoogleFonts.quicksand(),
            ),
          ),
          Center(
            child: Text(
              "Or",
              style: GoogleFonts.quicksand(
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            child: SocialButton(
                text: "Continue with facebook", socialIcon: facebookIcon),
          ),
          GoogleButton(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 50.0,
            width: double.infinity,
            child: Row(
              children: [
                Text(
                  "Don't have an account?",
                  style: GoogleFonts.quicksand(color: Colors.white),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.quicksand(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            height: 50.0,
            width: double.infinity,
            child: Text(
              "Forgot your passowrd?",
              style: GoogleFonts.quicksand(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
