import 'package:bibliotech_admin/config/api/http_admin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import '../dto/detalle_prestamo.dto.dart';

final getDetallePrestamoProvider = FutureProvider.family<DetallePrestamoDto, int>((ref, id) async {
  
  // var response = await ref
  //     .watch(apiProvider)
  //     .request<DetallePrestamoDto>('/prestamo/$id', parser: detallePrestamoFromJson);

  // if (response.error != null) {
  //   var logger = SimpleLogger();
  //   logger.warning(response.error!.exception);
  //   throw response.error!;
  // }

  // return response.data!;

  return DetallePrestamoDto(usuario: "usuario", publicacion: "publicacion", ejemplar: "ejemplar", fechaInicioPrestamo: "01/01/2023", fechaFinPrestamo: "08/01/2023", fechaDevolucion: "15/01/2023", estado: "FINALIZADO", renovaciones: [
    RenovacionDto(fechaInicioRenovacion: "09/01/2023", fechaFinRenovacion: "11/01/2023"),
    RenovacionDto(fechaInicioRenovacion: "12/01/2023", fechaFinRenovacion: "14/01/2023"),
    RenovacionDto(fechaInicioRenovacion: "14/01/2023", fechaFinRenovacion: "15/01/2023"),
  ]);

});