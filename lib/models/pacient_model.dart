// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:psyco_space/models/anamnese_model.dart';
import 'package:psyco_space/models/mental_exam_model.dart';
import 'package:psyco_space/models/register_model.dart';

class PacientModel {
  String? pacientId;
  String? nome;
  String? sobrenome;
  String? aniversario;
  String? cidade;
  String? bairro;
  String? numero;
  String? email;
  String? celular;
  String? telefone;
  String? firstSection;
  AnamneseModel? anamneseModel;
  MentalExamModel? mentalExamModel;
  RegisterModel? registerModel;

  PacientModel({
    this.pacientId,
    this.nome,
    this.sobrenome,
    this.aniversario,
    this.cidade,
    this.bairro,
    this.numero,
    this.email,
    this.celular,
    this.telefone,
    this.firstSection,
    this.anamneseModel,
    this.mentalExamModel,
    this.registerModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'pacientId': pacientId,
      'nome': nome,
      'sobrenome': sobrenome,
      'aniversario': aniversario,
      'cidade': cidade,
      'bairro': bairro,
      'numero': numero,
      'email': email,
      'celular': celular,
      'telefone': telefone,
      'firstSection': firstSection,
      'anamneseModel': anamneseModel?.toMap(),
      'mentalExamModel': mentalExamModel?.toMap(),
      'registerModel': registerModel?.toMap(),
    };
  }

  factory PacientModel.fromMap(Map<String, dynamic> map) {
    return PacientModel(
      pacientId: map['pacientId'],
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      aniversario: map['aniversario'],
      cidade: map['cidade'],
      bairro: map['bairro'],
      numero: map['numero'],
      email: map['email'],
      celular: map['celular'],
      telefone: map['telefone'],
      firstSection: map['firstSection'],
      anamneseModel: map['anamneseModel'] != null
          ? AnamneseModel.fromMap(map['anamneseModel'])
          : null,
      mentalExamModel: map['mentalExamModel'] != null
          ? MentalExamModel.fromMap(map['mentalExamModel'])
          : null,
      registerModel: map['registerModel'] != null
          ? RegisterModel.fromMap(map['registerModel'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PacientModel.fromJson(String source) =>
      PacientModel.fromMap(json.decode(source));

  PacientModel copyWith({
    String? pacientId,
    String? nome,
    String? sobrenome,
    String? aniversario,
    String? cidade,
    String? bairro,
    String? numero,
    String? email,
    String? celular,
    String? telefone,
    String? firstSection,
    AnamneseModel? anamneseModel,
    MentalExamModel? mentalExamModel,
    RegisterModel? registerModel,
  }) {
    return PacientModel(
      pacientId: pacientId ?? this.pacientId,
      nome: nome ?? this.nome,
      sobrenome: sobrenome ?? this.sobrenome,
      aniversario: aniversario ?? this.aniversario,
      cidade: cidade ?? this.cidade,
      bairro: bairro ?? this.bairro,
      numero: numero ?? this.numero,
      email: email ?? this.email,
      celular: celular ?? this.celular,
      telefone: telefone ?? this.telefone,
      firstSection: firstSection ?? this.firstSection,
      anamneseModel: anamneseModel ?? this.anamneseModel,
      mentalExamModel: mentalExamModel ?? this.mentalExamModel,
      registerModel: registerModel ?? this.registerModel,
    );
  }
}
