import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color btnText;
  final VoidCallback onPressed;

  const RectangularButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12), // Increased padding
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Increased border radius
        ),
        elevation: 10, // Increased elevation
        shadowColor: Colors.black.withOpacity(0.7), // Increased shadow opacity
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(color: btnText),
      ),
    );
  }
}