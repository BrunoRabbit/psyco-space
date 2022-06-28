import 'dart:math';

import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:psyco_space/app/exceptions/firebase_exceptions.dart';
import 'package:psyco_space/auth/auth.dart';
import 'package:psyco_space/models/pacient_model.dart';
import 'package:psyco_space/theme/app_snacks.dart';

class PacientController extends ChangeNotifier {
  List<PacientModel> listPacients = <PacientModel>[];
  List<PacientModel> currentPacientList = <PacientModel>[];
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd MM yyyy');
  CollectionReference refUsers = FirebaseFirestore.instance.collection('Users');
  final FirebaseAuth _refAuth = FirebaseAuth.instance;
  PacientModel? currentPacient;
  String searchKey = '';
  TextEditingController searchControl = TextEditingController();
  Auth auth = Auth();
  List<PacientModel> listHistory = [];

  List<PacientModel> get actualList => currentPacientList;

  resetList() {
    listPacients.clear();
    currentPacientList.clear();
    listHistory.clear();
  }

  void setCurrentPacient(PacientModel pacientModel) {
    currentPacient = pacientModel;
    notifyListeners();
  }

  Future<void> getAllPacients(BuildContext context) async {
    String idUser = auth.getUid();
    List<PacientModel> _listPacients = <PacientModel>[];
    try {
      QuerySnapshot<Map<String, dynamic>> result =
          await refUsers.doc(idUser).collection('pacients').get();

      for (var item in result.docs) {
        _listPacients.add(PacientModel.fromMap(item.data()));
      }
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
    }

    listPacients = _listPacients;
    currentPacientList = listPacients;
    notifyListeners();
  }

  String generateId() {
    return List.generate(10, (index) => Random().nextInt(9)).join('');
  }

  Future<bool> addPacientFirebase(
      PacientModel pacientModel, BuildContext context) async {
    User? user = _refAuth.currentUser;
    String idUser = user!.uid;
    try {
      await refUsers
          .doc(idUser)
          .collection('pacients')
          .doc(pacientModel.pacientId)
          .set(pacientModel.toMap());
      sucessSnackBar('Paciente adicionado com sucesso!', context);
      await getAllPacients(context);
      return true;
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }

  Future<void> editPacient(
      PacientModel editedPacientModel, BuildContext context) async {
    User? user = _refAuth.currentUser;
    String idUser = user!.uid;
    try {
      await refUsers
          .doc(idUser)
          .collection('pacients')
          .doc(editedPacientModel.pacientId)
          .update(editedPacientModel.toMap());
      sucessSnackBar('Paciente editado com sucesso!', context);

      await getAllPacients(context);
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
    }
  }

  void searchForm(String name) {
    if (name.isNotEmpty) {
      var newListPacients = listPacients
          .where(
            (form) => form.nome!.toLowerCase().contains(
                  name.toLowerCase(),
                ),
          )
          .toList();
      currentPacientList = newListPacients;
    } else {
      currentPacientList = listPacients;
    }
    notifyListeners();
  }

  Future<bool> addPacientAnamnese(
      PacientModel pacientModel, BuildContext context) async {
    User? user = _refAuth.currentUser;
    String idUser = user!.uid;

    currentPacient = currentPacient!.copyWith(
      anamneseModel: pacientModel.anamneseModel,
    );

    try {
      await refUsers
          .doc(idUser)
          .collection('pacients')
          .doc(currentPacient!.pacientId)
          .set(currentPacient!.toMap());
      sucessSnackBar('Informações adicionadas com sucesso', context);
      return true;
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }

  Future<bool> addPacientMentalExam(
      PacientModel pacientModel, BuildContext context) async {
    User? user = _refAuth.currentUser;
    String idUser = user!.uid;

    currentPacient = currentPacient!.copyWith(
      mentalExamModel: pacientModel.mentalExamModel,
    );

    try {
      await refUsers
          .doc(idUser)
          .collection('pacients')
          .doc(currentPacient!.pacientId)
          .set(currentPacient!.toMap());
      sucessSnackBar('Informações adicionadas com sucesso', context);
      return true;
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }

  Future<bool> addPacientRegister(
      PacientModel pacientModel, BuildContext context) async {
    User? user = _refAuth.currentUser;
    String idUser = user!.uid;

    currentPacient = currentPacient!.copyWith(
      registerModel: pacientModel.registerModel,
    );

    try {
      await refUsers
          .doc(idUser)
          .collection('pacients')
          .doc(currentPacient!.pacientId)
          .set(currentPacient!.toMap());
      sucessSnackBar('Informações adicionadas com sucesso', context);
      listHistory.add(currentPacient!);
      return true;
    } on FirebaseException catch (e) {
      failedSnackBar(readFirebaseException(e.message!), context);
      return false;
    }
  }

  Future<void> openDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    notifyListeners();
  }
}
