import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passwordIsHidden = true;
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
              controller: userName,
              decoration: InputDecoration(
                labelText: "Username",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordIsHidden = !passwordIsHidden;
                    });
                  },
                  icon: passwordIsHidden
                      ? Icon(Icons.visibility, color: Colors.grey)
                      : Icon(Icons.visibility_off, color: Colors.grey),
                ),
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
              controller: email,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.email),
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
              obscureText: passwordIsHidden,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordIsHidden = !passwordIsHidden;
                    });
                  },
                  icon: passwordIsHidden
                      ? Icon(Icons.visibility, color: Colors.grey)
                      : Icon(Icons.visibility_off, color: Colors.grey),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 50.0,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "By selecting Agreen and continue below,",
                  style: GoogleFonts.quicksand(color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      "I agree to ",
                      style: GoogleFonts.quicksand(color: Colors.white),
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      "Terms of service and Privacy Policy",
                      style: GoogleFonts.quicksand(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          CupertinoButton.filled(
            onPressed: () {},
            child: Text(
              "Agree and continue",
              style: GoogleFonts.quicksand(),
            ),
          ),
        ],
      ),
    );
  }
}
