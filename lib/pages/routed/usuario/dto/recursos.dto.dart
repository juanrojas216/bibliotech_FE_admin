// To parse this JSON data, do
//
//     final recursos = recursosFromJson(jsonString);

List<Recurso> recursosFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Recurso>.from(
      str.map((x) => Recurso.fromJson(x)));
}


List<Map> actionsFromJson(dynamic data) {
  List<dynamic> str = data;
  return List<Map>.from(str.map((x) => {
    "active": false,
    "accion": x,
  }));
}



class Recurso {
    int id;
    String name;

    Recurso({
        required this.id,
        required this.name,
    });

    Recurso copyWith({
        int? id,
        String? name,
    }) => 
        Recurso(
            id: id ?? this.id,
            name: name ?? this.name,
        );

    factory Recurso.fromJson(Map<String, dynamic> json) => Recurso(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
