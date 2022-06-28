import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/app/exceptions/firebase_exceptions.dart';
import 'package:psyco_space/auth/auth.dart';
import 'package:psyco_space/controllers/settings_controller.dart';
import 'package:psyco_space/models/address_model.dart';
import 'package:psyco_space/models/psychologist_model.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class SignUpController extends ChangeNotifier {
  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth _refAuth = FirebaseAuth.instance;
  PsychologistModel psychoModel = PsychologistModel();
  Auth auth = Auth();

  String generateId() {
    return List.generate(10, (index) => Random().nextInt(9)).join('');
  }

  setPersonalStep(PsychologistModel psychologistModel) {
    psychoModel = psychoModel.copyWith(
      name: psychologistModel.name,
      password: psychologistModel.password,
    );
    notifyListeners();
  }

  setEmailSep(PsychologistModel psychologistModel) {
    psychoModel = psychoModel.copyWith(
      email: psychologistModel.email,
    );
    notifyListeners();
  }

  setAdressStep(AddressModel addressModel) {
    psychoModel = psychoModel.copyWith(
      addressModel: AddressModel(
        cep: addressModel.cep,
        city: addressModel.city,
        country: addressModel.country,
        district: addressModel.district,
        number: addressModel.number,
        stateUF: addressModel.stateUF,
        street: addressModel.street,
      ),
    );
    notifyListeners();
  }

  Future<UserCredential> registerPsychoInAuth() async {
    return await _refAuth.createUserWithEmailAndPassword(
      email: psychoModel.email!,
      password: psychoModel.copyWith().password!,
    );
  }

  Future<bool> createPsychoInDatabase(BuildContext context) async {
    final _controller = Provider.of<SettingsController>(context, listen: false);
    try {
      UserCredential user = await registerPsychoInAuth();

      await userRef
          .doc(user.user!.uid)
          .collection('psychologist')
          .doc('psyco_infos')
          .set(
            psychoModel.toMap(),
          );

      await _controller.getCurrentPsyco(context);
      notifyListeners();

      sucessSnackBar('Criado com sucesso, por favor aguarde', context);

      return true;
    } on FirebaseAuthException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }
}
