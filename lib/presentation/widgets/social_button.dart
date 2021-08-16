import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SocialButton extends StatelessWidget {
  late String text;
  late Widget socialIcon;
  SocialButton({
    Key? key,
    required this.text,
    required this.socialIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.only(right: 70.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          socialIcon,
          Text(
            text,
            style: GoogleFonts.quicksand(),
          )
        ],
      ),
    );
  }
}
