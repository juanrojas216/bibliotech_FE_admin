import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../controllers/get_prestamos.controller.dart';
import '../controllers/get_usuario.controller.dart';
import '../services/prestamo_rows.service.dart';
import 'tabla_prestamo.dart';

class ResultadosPrestamos extends ConsumerWidget {
  final int idUsuario;

  const ResultadosPrestamos(
    this.idUsuario, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var search = ref.watch(searchPrestamosProvider(idUsuario));

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          data: (data) => SizedBox(
            height: 1000,
            width: 800,
            child: TablaPrestamo( idUsuario ,rows: prestamoGetRows(data)),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(searchUsuariosProvider);
                  },
                  child: Text('Reintentar cargar resultados',
                      style: GoogleFonts.poppins()))),
          loading: () => const SizedBox(
            height: 1000,
            width: 800,
            child: Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
