import 'dart:convert';

class MentalExamModel {
  String? altura;
  String? peso;
  String? vestuario;
  String? atitudeDominante;
  String? comportamento;
  String? discurso;
  String? estadoEmocional;
  String? percepcao;
  String? pensamento;
  String? cognicao;
  String? consciencia;

  MentalExamModel({
    this.altura,
    this.peso,
    this.vestuario,
    this.atitudeDominante,
    this.comportamento,
    this.discurso,
    this.estadoEmocional,
    this.percepcao,
    this.pensamento,
    this.cognicao,
    this.consciencia,
  });

  Map<String, dynamic> toMap() {
    return {
      'altura': altura,
      'peso': peso,
      'vestuario': vestuario,
      'atitudeDominante': atitudeDominante,
      'comportamento': comportamento,
      'discurso': discurso,
      'estadoEmocional': estadoEmocional,
      'percepcao': percepcao,
      'pensamento': pensamento,
      'cognicao': cognicao,
      'consciencia': consciencia,
    };
  }

  factory MentalExamModel.fromMap(Map<String, dynamic> map) {
    return MentalExamModel(
      altura: map['altura'],
      peso: map['peso'],
      vestuario: map['vestuario'],
      atitudeDominante: map['atitudeDominante'],
      comportamento: map['comportamento'],
      discurso: map['discurso'],
      estadoEmocional: map['estadoEmocional'],
      percepcao: map['percepcao'],
      pensamento: map['pensamento'],
      cognicao: map['cognicao'],
      consciencia: map['consciencia'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MentalExamModel.fromJson(String source) =>
      MentalExamModel.fromMap(json.decode(source));

  MentalExamModel copyWith({
    String? altura,
    String? peso,
    String? vestuario,
    String? atitudeDominante,
    String? comportamento,
    String? discurso,
    String? estadoEmocional,
    String? percepcao,
    String? pensamento,
    String? cognicao,
    String? consciencia,
  }) {
    return MentalExamModel(
      altura: altura ?? this.altura,
      peso: peso ?? this.peso,
      vestuario: vestuario ?? this.vestuario,
      atitudeDominante: atitudeDominante ?? this.atitudeDominante,
      comportamento: comportamento ?? this.comportamento,
      discurso: discurso ?? this.discurso,
      estadoEmocional: estadoEmocional ?? this.estadoEmocional,
      percepcao: percepcao ?? this.percepcao,
      pensamento: pensamento ?? this.pensamento,
      cognicao: cognicao ?? this.cognicao,
      consciencia: consciencia ?? this.consciencia,
    );
  }
}
