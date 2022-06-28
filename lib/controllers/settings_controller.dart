import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:psyco_space/app/exceptions/firebase_exceptions.dart';
import 'package:psyco_space/auth/auth.dart';
import 'package:psyco_space/models/psychologist_model.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class SettingsController extends ChangeNotifier {
  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');

  PsychologistModel psychoModel = PsychologistModel();
  Auth auth = Auth();

  Future<bool> getCurrentPsyco(BuildContext context) async {
    String idUser = auth.getUid();
    try {
      DocumentSnapshot<Map<String, dynamic>> result = await userRef
          .doc(idUser)
          .collection('psychologist')
          .doc('psyco_infos')
          .get();
      try {
        psychoModel = PsychologistModel.fromMap(result.data()!);
        return true;
      } catch (e) {
        failedSnackBar('Sua conta não existe', context);
        return false;
      }
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }

  Future<bool> changePsychologyst(
      PsychologistModel psycho, BuildContext context) async {
    psychoModel = psychoModel.copyWith(
      name: psycho.name,
      email: psycho.email,
      password: psycho.password,
      addressModel: psycho.addressModel,
    );
    String idUser = auth.getUid();

    try {
      await userRef
          .doc(idUser)
          .collection('psychologist')
          .doc('psyco_infos')
          .update(psychoModel.toMap());
      notifyListeners();
      return true;
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }
}
