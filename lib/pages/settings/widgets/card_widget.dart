// ignore_for_file: constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const CardWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        elevation: 8,
        child: InkWell(
          onTap: widget.onTap,
          child: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_right_rounded),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
