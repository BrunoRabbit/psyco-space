import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfo extends StatelessWidget {
  final String leading;
  final String title;
  final double? leadingSize;
  final double? titleSize;
  final TextOverflow? overflowLeading;
  final TextOverflow? overflowTitle;
  const PersonalInfo({
    Key? key,
    required this.leading,
    required this.title,
    this.leadingSize,
    this.titleSize,
    this.overflowLeading,
    this.overflowTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(
              leading,
              overflow: overflowLeading ?? TextOverflow.ellipsis,
              style: GoogleFonts.rubik(
                fontSize: leadingSize ?? 18,
                color: Colors.black.withOpacity(0.55),
              ),
            ),
          ),
          Flexible(
            child: Text(
              title,
              overflow: overflowTitle ?? TextOverflow.ellipsis,
              style: GoogleFonts.rubik(
                fontSize: titleSize ?? 18,
                color: Colors.black.withOpacity(0.75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
