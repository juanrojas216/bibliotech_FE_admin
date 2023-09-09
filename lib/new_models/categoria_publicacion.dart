import 'dart:convert';

import 'categoria.dart';
import 'valor.dart';

List<CategoriaPublicacion> categoriasPublicacionFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<CategoriaPublicacion>.from(str.map((x) => CategoriaPublicacion.fromJson(x)));
}

CategoriaPublicacion categoriaPublicacionFromJson(dynamic str) {
  Map<String, dynamic> data = str;
  return CategoriaPublicacion.fromJson(data);
}

String categoriaPublicacionToJson(CategoriaPublicacion data) {
  return json.encode(data.toJson());
}

String categoriasPublicacionToJson(List<CategoriaPublicacion> data) {
  return json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}

class CategoriaPublicacion {
    Categoria categoria;
    List<Valor> valores;

    CategoriaPublicacion({
        required this.categoria,
        required this.valores,
    });

    CategoriaPublicacion copyWith({
        Categoria? categoria,
        List<Valor>? valores,
    }) => 
        CategoriaPublicacion(
            categoria: categoria ?? this.categoria,
            valores: valores ?? this.valores,
        );

    factory CategoriaPublicacion.fromJson(Map<String, dynamic> json) => CategoriaPublicacion(
        categoria: Categoria.fromJson(json["categoria"]),
        valores: List<Valor>.from(json["valores"].map((x) => Valor.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categoria": categoria.toJson(),
        "valores": List<dynamic>.from(valores.map((x) => x.toJson())),
    };
}