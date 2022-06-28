import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnamneseTitle extends StatelessWidget {
  final String leading;
  const AnamneseTitle({
    Key? key,
    required this.leading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 8),
      child: Text(
        leading,
        style: GoogleFonts.rubik(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.65),
        ),
      ),
    );
  }
}
