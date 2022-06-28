// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/widgets/app_bottom_sheet_widget.dart';
import 'package:psyco_space/app/widgets/app_elevated_button_widget.dart';
import 'package:psyco_space/pages/root/root_page.dart';
import 'package:psyco_space/routes.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User?>(context);
    if (firebaseUser != null) {
      return const RootPage();
    }

    return WillPopScope(
      onWillPop: () async {
        final bool? feedback = await showModalBottomSheet<bool>(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (ctx) =>
                AppBottomSheetWidget.buildExitAppBottomSheet(context));

        if (feedback != null) {
          return feedback;
        }
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              top: 32,
              right: 32,
              bottom: 30,
              left: 32,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem vindo ao PsycoSpace!',
                    style: GoogleFonts.rubik(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.black.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Comece hoje a gerenciar clientes, monitorar consultas, planejar eventos e muito mais!',
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      color: Colors.black.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/welcome.svg',
                    height: 300,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppElevatedButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppPlaces.kSignInPage,
                      );
                    },
                    label: 'Entrar',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppElevatedButtonWidget(
                    label: 'Cadastrar',
                    isLineButton: true,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppPlaces.kSignUpPage,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
