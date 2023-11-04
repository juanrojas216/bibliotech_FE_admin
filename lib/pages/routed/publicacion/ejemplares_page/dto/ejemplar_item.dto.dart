
import 'dart:convert';

List<EjemplarItemDto> ejemplaresItemFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<EjemplarItemDto>.from(str.map((x) => EjemplarItemDto.fromJson(x)));
}

String ejemplarItemToJson(EjemplarItemDto data) {
  return json.encode(data.toJson());
}

List<Ubicacion> ubicacionesFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Ubicacion>.from(str.map((x) => Ubicacion.fromJson(x)));
}

class EjemplarItemDto {
    int id;
    String serialNfc;
    int valoracion;
    bool tieneComentarios;
    String estado;
    Ubicacion ubicacion;

    EjemplarItemDto({
        required this.id,
        required this.serialNfc,
        required this.valoracion,
        required this.tieneComentarios,
        required this.estado,
        required this.ubicacion,
    });

    EjemplarItemDto copyWith({
        int? id,
        String? serialNfc,
        int? valoracion,
        bool? tieneComentarios,
        String? estado,
        Ubicacion? ubicacion,
    }) => 
        EjemplarItemDto(
            id: id ?? this.id,
            serialNfc: serialNfc ?? this.serialNfc,
            valoracion: valoracion ?? this.valoracion,
            tieneComentarios: tieneComentarios ?? this.tieneComentarios,
            estado: estado ?? this.estado,
            ubicacion: ubicacion ?? this.ubicacion,
        );

    factory EjemplarItemDto.fromJson(Map<String, dynamic> json) => EjemplarItemDto(
        id: json["id"],
        serialNfc: json["serialNFC"],
        valoracion: json["valoracion"],
        tieneComentarios: json["tieneComentarios"],
        estado: json["estado"],
        ubicacion: Ubicacion.fromJson(json["ubicacion"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "serialNFC": serialNfc,
    //     "valoracion": valoracion,
    //     "tieneComentarios": tieneComentarios,
    //     "estado": estado,
    //     "ubicacion": ubicacion.toJson(),
    // };
    Map<String, dynamic> toJson() => {
        "serialNFC": serialNfc,
        "estadoEjemplar": estado,
        "idUbicacion": ubicacion.id,
    };
}

class Ubicacion {
    int id;
    String descripcion;

    Ubicacion({
        required this.id,
        required this.descripcion,
    });

    Ubicacion copyWith({
        int? id,
        String? descripcion,
        bool? ocupada,
        DateTime? fechaAlta,
        dynamic fechaBaja,
        dynamic biblioteca,
    }) => 
        Ubicacion(
            id: id ?? this.id,
            descripcion: descripcion ?? this.descripcion,
        );

    factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        id: json["id"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "descripcion": descripcion,
    };
}