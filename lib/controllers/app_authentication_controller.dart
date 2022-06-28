import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psyco_space/controllers/pacient_controller.dart';

class AppAuthenticationController extends ChangeNotifier {
  CollectionReference userRef = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth ref = FirebaseAuth.instance;

  Future<void> signOut(BuildContext context) async {
    final _controller = Provider.of<PacientController>(context, listen: false);

    try {
      await ref.signOut();
      _controller.resetList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
