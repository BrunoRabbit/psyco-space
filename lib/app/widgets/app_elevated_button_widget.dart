import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppElevatedButtonWidget extends StatefulWidget {
  final Function() onTap;
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final bool isLineButton;
  final double size;

  const AppElevatedButtonWidget({
    Key? key,
    required this.onTap,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.isLineButton = false,
    this.size = double.infinity,
    required this.label,
  }) : super(key: key);

  @override
  _AppElevatedButtonWidgetState createState() =>
      _AppElevatedButtonWidgetState();
}

class _AppElevatedButtonWidgetState extends State<AppElevatedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: widget.isLineButton ? Colors.transparent : null,
          primary: widget.isLineButton ? Colors.white : widget.backgroundColor,
          side: widget.isLineButton
              ? BorderSide(
                  color: widget.backgroundColor,
                )
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
        onPressed: widget.onTap,
        child: Text(
          widget.label,
          style: GoogleFonts.rubik(
            fontSize: 16,
            color:
                widget.isLineButton ? widget.backgroundColor : widget.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
