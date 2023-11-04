

class EjemplarDto {

  String? serialNFC;
  int? publicacionId;
  // int? usuarioId;
  int? ubicacionId;


  EjemplarDto({
    required this.serialNFC,
    required this.publicacionId,
    // required this.usuarioId,
    this.ubicacionId,
  });

  Map<String, dynamic> toMap() {
    return {
      'serialNFC': serialNFC,
      'idPublicacion': publicacionId,
      'idUbicacion': ubicacionId,
      // 'usuarioId': usuarioId,
    };
  }
}