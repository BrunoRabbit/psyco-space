import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';

class AppBottomSheetWidget {
  static Widget buildExitAppBottomSheet(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 64, 61, 86),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          )),
      child: Padding(
        padding: const EdgeInsets.all(
          25,
        ),
        child: Column(
          children: [
            Text(
              'Deseja sair do app? fique tranquilo, estaremos esperando por você aqui!',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            AppElevatedButtonWidget(
              onTap: () {
                Navigator.of(context).pop(false);
              },
              label: 'Vou ficar!',
            ),
            const SizedBox(
              height: 20,
            ),
            AppElevatedButtonWidget(
              backgroundColor: Colors.white,
              isLineButton: true,
              onTap: () {
                Navigator.of(context).pop(true);
              },
              label: 'Sair',
            ),
          ],
        ),
      ),
    );
  }
}
