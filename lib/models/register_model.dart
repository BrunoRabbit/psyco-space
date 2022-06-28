import 'dart:convert';

class RegisterModel {
  String? agenda;
  String? dateTime;
  String? startTime;
  String? finishTime;
  String? humor;
  String? atividadeRealizada;
  String? resumo;
  String? feedBack;
  String? encerramentoEncaminhamento;
  RegisterModel({
    this.agenda,
    this.dateTime,
    this.startTime,
    this.finishTime,
    this.humor,
    this.atividadeRealizada,
    this.resumo,
    this.feedBack,
    this.encerramentoEncaminhamento,
  });

  RegisterModel copyWith({
    String? agenda,
    String? dateTime,
    String? startTime,
    String? finishTime,
    String? humor,
    String? atividadeRealizada,
    String? resumo,
    String? feedBack,
    String? encerramentoEncaminhamento,
  }) {
    return RegisterModel(
      agenda: agenda ?? this.agenda,
      dateTime: dateTime ?? this.dateTime,
      startTime: startTime ?? this.startTime,
      finishTime: finishTime ?? this.finishTime,
      humor: humor ?? this.humor,
      atividadeRealizada: atividadeRealizada ?? this.atividadeRealizada,
      resumo: resumo ?? this.resumo,
      feedBack: feedBack ?? this.feedBack,
      encerramentoEncaminhamento:
          encerramentoEncaminhamento ?? this.encerramentoEncaminhamento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'agenda': agenda,
      'dateTime': dateTime,
      'startTime': startTime,
      'finishTime': finishTime,
      'humor': humor,
      'atividadeRealizada': atividadeRealizada,
      'resumo': resumo,
      'feedBack': feedBack,
      'encerramentoEncaminhamento': encerramentoEncaminhamento,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      agenda: map['agenda'],
      dateTime: map['dateTime'],
      startTime: map['startTime'],
      finishTime: map['finishTime'],
      humor: map['humor'],
      atividadeRealizada: map['atividadeRealizada'],
      resumo: map['resumo'],
      feedBack: map['feedBack'],
      encerramentoEncaminhamento: map['encerramentoEncaminhamento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));
}
