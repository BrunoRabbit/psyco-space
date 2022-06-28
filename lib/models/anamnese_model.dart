import 'dart:convert';

class AnamneseModel {
  String? queixaPrincipal;
  String? descricao;
  String? sintese;
  String? sintomas;
  String? quandoSurgiu;
  String? fatoresAgravantes;
  String? circunstancia;
  String? tabagismo;
  String? alcoolismo;
  String? sedentarismo;
  String? sintomasParecidos;
  String? familiaresDoenca;
  AnamneseModel({
    this.queixaPrincipal,
    this.descricao,
    this.sintese,
    this.sintomas,
    this.quandoSurgiu,
    this.fatoresAgravantes,
    this.circunstancia,
    this.tabagismo,
    this.alcoolismo,
    this.sedentarismo,
    this.sintomasParecidos,
    this.familiaresDoenca,
  });

  Map<String, dynamic> toMap() {
    return {
      'queixaPrincipal': queixaPrincipal,
      'descricao': descricao,
      'sintese': sintese,
      'sintomas': sintomas,
      'quandoSurgiu': quandoSurgiu,
      'fatoresAgravantes': fatoresAgravantes,
      'circunstancia': circunstancia,
      'tabagismo': tabagismo,
      'alcoolismo': alcoolismo,
      'sedentarismo': sedentarismo,
      'sintomasParecidos': sintomasParecidos,
      'familiaresDoenca': familiaresDoenca,
    };
  }

  factory AnamneseModel.fromMap(Map<String, dynamic> map) {
    return AnamneseModel(
      queixaPrincipal: map['queixaPrincipal'],
      descricao: map['descricao'],
      sintese: map['sintese'],
      sintomas: map['sintomas'],
      quandoSurgiu: map['quandoSurgiu'],
      fatoresAgravantes: map['fatoresAgravantes'],
      circunstancia: map['circunstancia'],
      tabagismo: map['tabagismo'],
      alcoolismo: map['alcoolismo'],
      sedentarismo: map['sedentarismo'],
      sintomasParecidos: map['sintomasParecidos'],
      familiaresDoenca: map['familiaresDoenca'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnamneseModel.fromJson(String source) =>
      AnamneseModel.fromMap(json.decode(source));

  AnamneseModel copyWith({
    String? queixaPrincipal,
    String? descricao,
    String? sintese,
    String? sintomas,
    String? quandoSurgiu,
    String? fatoresAgravantes,
    String? circunstancia,
    String? tabagismo,
    String? alcoolismo,
    String? sedentarismo,
    String? sintomasParecidos,
    String? familiaresDoenca,
  }) {
    return AnamneseModel(
      queixaPrincipal: queixaPrincipal ?? this.queixaPrincipal,
      descricao: descricao ?? this.descricao,
      sintese: sintese ?? this.sintese,
      sintomas: sintomas ?? this.sintomas,
      quandoSurgiu: quandoSurgiu ?? this.quandoSurgiu,
      fatoresAgravantes: fatoresAgravantes ?? this.fatoresAgravantes,
      circunstancia: circunstancia ?? this.circunstancia,
      tabagismo: tabagismo ?? this.tabagismo,
      alcoolismo: alcoolismo ?? this.alcoolismo,
      sedentarismo: sedentarismo ?? this.sedentarismo,
      sintomasParecidos: sintomasParecidos ?? this.sintomasParecidos,
      familiaresDoenca: familiaresDoenca ?? this.familiaresDoenca,
    );
  }
}
