List<RolUsuarioDto> rolesUsuarioDtoFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<RolUsuarioDto>.from(str.map((x) => RolUsuarioDto.fromJson(x)));
}

List<Entidad> entidadesRolesUsuarioDtoFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Entidad>.from(str.map((x) => Entidad.fromJson(x)));
}

List<Privilegio> privilegiosRolesUsuarioDtoFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Privilegio>.from(str.map((x) => Privilegio.fromJson(x)));
}

class RolUsuarioDto {
  int idRol;
  String nombreRol;
  Entidad entidad;
  List<Privilegio> privilegios;

  RolUsuarioDto({
    required this.idRol,
    required this.nombreRol,
    required this.entidad,
    required this.privilegios,
  });

  RolUsuarioDto copyWith({
    int? idRol,
    String? nombreRol,
    Entidad? entidad,
    List<Privilegio>? privilegios,
  }) =>
      RolUsuarioDto(
        idRol: idRol ?? this.idRol,
        nombreRol: nombreRol ?? this.nombreRol,
        entidad: entidad ?? this.entidad,
        privilegios: privilegios ?? this.privilegios,
      );

  factory RolUsuarioDto.fromJson(Map<String, dynamic> json) => RolUsuarioDto(
        idRol: json["idRol"],
        nombreRol: json["nombreRol"],
        entidad: Entidad.fromJson(json["entidad"]),
        privilegios: List<Privilegio>.from(
            json["privilegios"].map((x) => Privilegio.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "idRol": idRol,
  //       "nombreRol": nombreRol,
  //       "entidad": entidad.toJson(),
  //       "privilegios": List<dynamic>.from(privilegios.map((x) => x.toJson())),
  //     };

  Map<String, dynamic> toJson() => {
        "idRol": idRol,
        "nombreRol": nombreRol,
        "entidad": entidad.idEntidad,
        "privilegios": List<dynamic>.from(privilegios.where((e) => e.activo).map((e) => e.idPrivilegio)),
      };
}

class Entidad {
  int idEntidad;
  String nombreEntidad;

  Entidad({
    required this.idEntidad,
    required this.nombreEntidad,
  });

  Entidad copyWith({
    int? idEntidad,
    String? nombreEntidad,
  }) =>
      Entidad(
        idEntidad: idEntidad ?? this.idEntidad,
        nombreEntidad: nombreEntidad ?? this.nombreEntidad,
      );

  factory Entidad.fromJson(Map<String, dynamic> json) => Entidad(
        idEntidad: json["idEntidad"],
        nombreEntidad: json["nombreEntidad"],
      );

  Map<String, dynamic> toJson() => {
        "idEntidad": idEntidad,
        "nombreEntidad": nombreEntidad,
      };
}

class Privilegio {
  int idPrivilegio;
  String nombre;
  bool activo;

  Privilegio({
    required this.idPrivilegio,
    required this.nombre,
    required this.activo,
  });

  Privilegio copyWith({
    int? idPrivilegio,
    String? nombre,
    bool? activo,
  }) =>
      Privilegio(
        idPrivilegio: idPrivilegio ?? this.idPrivilegio,
        nombre: nombre ?? this.nombre,
        activo: activo ?? this.activo,
      );

  factory Privilegio.fromJson(Map<String, dynamic> json) => Privilegio(
        idPrivilegio: json["idPrivilegio"],
        nombre: json["nombre"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "idPrivilegio": idPrivilegio,
        "nombre": nombre,
        "activo": activo,
      };
}

class CreateRol {
  String nombreRol;
  Entidad entidad;
  List<Privilegio> privilegios;

  CreateRol({
    required this.nombreRol,
    required this.entidad,
    required this.privilegios,
  });

  Map<String, dynamic> toJson() => {
    "idPrivilegios": List<dynamic>.from(privilegios.where((e) => e.activo).map((e) => e.idPrivilegio)),
    "nombre": nombreRol,
    "idEntidad": entidad.idEntidad,
  };
}
