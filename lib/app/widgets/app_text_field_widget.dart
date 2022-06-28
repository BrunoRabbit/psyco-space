import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final FocusNode? focusNode;
  final String? errorText;
  final Function(String)? onChanged;
  final bool isActive;
  final bool isObscureText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatters;
  final String? Function(String?)? validator;

  const AppTextFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    this.focusNode,
    this.errorText,
    this.onChanged,
    this.isActive = true,
    this.isObscureText = false,
    this.textInputType,
    this.textInputFormatters,
    this.validator,
  }) : super(key: key);

  @override
  _AppTextFieldWidgetState createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onChanged: widget.onChanged,
      inputFormatters: widget.textInputFormatters,
      enabled: widget.isActive,
      obscureText: widget.isObscureText,
      controller: widget.controller,
      style: GoogleFonts.rubik(
        fontSize: 16,
      ),
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        errorText: widget.errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.rubik(
          fontSize: 16,
        ),
      ),
    );
  }
}
