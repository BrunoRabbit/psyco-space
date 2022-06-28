import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/exceptions/firebase_exceptions.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/routes.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class SignInController extends ChangeNotifier {
  final FirebaseAuth _authRef = FirebaseAuth.instance;

  Future<bool> signIn(
      String email, String password, BuildContext context) async {
    final _settingsController =
        Provider.of<SettingsController>(context, listen: false);
    final _pacientsController =
        Provider.of<PacientController>(context, listen: false);
    try {
      await _authRef.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (await _settingsController.getCurrentPsyco(context)) {
        await _pacientsController.getAllPacients(context);
        sucessSnackBar('Entrando, por favor aguarde', context);
        Navigator.pushNamed(context, AppPlaces.kRootPage);
      }
      return true;
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }
}
