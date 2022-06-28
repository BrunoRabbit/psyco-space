import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalTitle extends StatelessWidget {
  final String leading;
  final IconData? icon;
  final double? fontSize;
  final double? iconSize;

  const PersonalTitle({
    Key? key,
    required this.leading,
    this.icon,
    this.fontSize,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(
              icon,
              size: iconSize ?? 24.0,
              color: Colors.black.withOpacity(0.65),
            ),
          ),
          Text(
            leading,
            style: GoogleFonts.rubik(
              fontSize: fontSize ?? 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
