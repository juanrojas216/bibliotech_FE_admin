import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../controllers/get_publicacion.controller.dart';
import '../controllers/get_usuario.controller.dart';
import '../services/publicacion_rows.service.dart';
import 'tabla_publicacion.dart';

class ResultadosPublicacion extends ConsumerWidget {
  final int idUsuario;

  const ResultadosPublicacion(
    this.idUsuario, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var search = ref.watch(searchPublicacionProvider);

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          data: (data) => SizedBox(
            height: 1000,
            width: 800,
            child: TablaPublicacion( idUsuario ,rows: publicacionGetRows(data)),
          ),
          error: (error, stackTrace) => Center(
              child: ElevatedButton(
                  onPressed: () {
                    ref.invalidate(searchUsuariosProvider);
                  },
                  child: Text('Reintentar cargar publicaciones',
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
