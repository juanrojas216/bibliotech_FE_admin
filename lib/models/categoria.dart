

import 'dart:convert';

List<Categoria> categoriaFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Categoria>.from(str.map((x) => Categoria.fromJson(x)));
}

String categoriaToJson(List<Categoria> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoria {
  final int idCategoria;
  final String nombreCategoria;
  List<Valor> valores;
  bool seleccionadoCategoria = false;


  Categoria({
    required this.idCategoria,
    required this.nombreCategoria,
    required this.valores,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        idCategoria: json["idCategoria"],
        nombreCategoria: json["nombreCategoria"],
        valores:
            List<Valor>.from(json["valores"].map((x) => Valor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idCategoria": idCategoria,
        "nombreCategoria": nombreCategoria,
        "valores": List<dynamic>.from(valores.map((x) => x.toJson())),
      };
  
  set setValores (List<Valor> valors) {
    valores = valors;
  }

  Categoria copyInstance() => Categoria(idCategoria: idCategoria, nombreCategoria: nombreCategoria, valores: valores.map((e) => e.copyInstance()).toList());
}

class Valor {
  final int idValor;
  final String nombreValor;
  bool seleccionadoValor;

  Valor({
    required this.idValor,
    required this.nombreValor,
    this.seleccionadoValor = false,
  });

  factory Valor.fromJson(Map<String, dynamic> json) => Valor(
        idValor: json["idValor"],
        nombreValor: json["nombreValor"],
      );

  Map<String, dynamic> toJson() => {
        "idValor": idValor,
        "nombreValor": nombreValor,
      };

  Valor copyInstance() => Valor(idValor: idValor, nombreValor: nombreValor, seleccionadoValor: seleccionadoValor);
  
}
