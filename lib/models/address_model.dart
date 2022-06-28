import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  String? country;
  String? cep;
  String? stateUF;
  String? city;
  String? district;
  String? street;
  String? number;
  AddressModel({
    this.country,
    this.cep,
    this.stateUF,
    this.city,
    this.district,
    this.street,
    this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'cep': cep,
      'stateUF': stateUF,
      'city': city,
      'district': district,
      'street': street,
      'number': number,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      country: map['country'],
      cep: map['cep'],
      stateUF: map['stateUF'],
      city: map['city'],
      district: map['district'],
      street: map['street'],
      number: map['number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  AddressModel copyWith({
    String? country,
    String? cep,
    String? stateUF,
    String? city,
    String? district,
    String? street,
    String? number,
  }) {
    return AddressModel(
      country: country ?? this.country,
      cep: cep ?? this.cep,
      stateUF: stateUF ?? this.stateUF,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
      number: number ?? this.number,
    );
  }
}
