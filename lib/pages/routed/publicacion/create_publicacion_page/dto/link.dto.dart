class LinkDto {
  String? url;
  String? estado;
  int? plataformaId;

  LinkDto({
    required this.url,
    required this.estado,
    required this.plataformaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'estado': estado,
      'plataformaId': plataformaId,
    };
  }

  LinkDto copyWith({
    String? url,
    String? estado,
    int? plataformaId,
  }) =>
      LinkDto(
        url: url ?? this.url,
        estado: estado ?? this.estado,
        plataformaId: plataformaId ?? this.plataformaId,
      );
}
