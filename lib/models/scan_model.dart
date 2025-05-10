// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int? id;
  String? tipo;
  String valor;

  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      this.tipo == 'http';
    } else {
      this.tipo == 'geo';
    }
  }

  @override
  String toString() {
    return 'ID: $id | TIPO: $tipo | VALOR: $valor';
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) =>
      ScanModel(id: json["id"], tipo: json["tipo"], valor: json["valor"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
