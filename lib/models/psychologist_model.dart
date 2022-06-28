import 'dart:convert';

import 'package:psyco_space/models/address_model.dart';

class PsychologistModel {
  String? name;
  String? email;
  String? password;
  AddressModel? addressModel;

  PsychologistModel({
    this.name,
    this.email,
    this.password,
    this.addressModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'addressModel': addressModel?.toMap(),
    };
  }

  factory PsychologistModel.fromMap(Map<String, dynamic> map) {
    return PsychologistModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      addressModel: map['addressModel'] != null
          ? AddressModel.fromMap(map['addressModel'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PsychologistModel.fromJson(String source) =>
      PsychologistModel.fromMap(json.decode(source));

  PsychologistModel copyWith({
    String? idPsychologist,
    String? name,
    String? email,
    String? password,
    AddressModel? addressModel,
  }) {
    return PsychologistModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      addressModel: addressModel ?? this.addressModel,
    );
  }
}
