import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psyco_space/theme/app_colors.dart';

// ScaffoldMessenger.of(context).showSnackBar(snackBar);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> sucessSnackBar(
  String title,
  BuildContext context,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primary,
      content: Text(
        title,
        style: GoogleFonts.rubik(),
      ),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> failedSnackBar(
  String title,
  BuildContext context,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.errorColor,
      content: Text(
        title,
        style: GoogleFonts.rubik(),
      ),
    ),
  );
}
