import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dto/create_multa.dto.dart';

final createMultaProvider = StateProvider<CreateMultaDto>((ref) {
  return CreateMultaDto(
    idUsuario: null,
    // idPublicacion: null,
    idEjemplar: null,
    nombre: null,
    nombrePublicacion: null,
    idPrestamo: null,
    fechaInicioMulta: null,
  );
});
