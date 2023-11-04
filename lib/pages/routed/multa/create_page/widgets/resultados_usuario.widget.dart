import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/get_usuario.controller.dart';
import '../services/usuario_rows.service.dart';
import 'tabla_usuario.dart';

class ResultadosUsuarios extends ConsumerWidget {
  const ResultadosUsuarios({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var search = ref.watch(searchUsuariosProvider);

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: search.when(
          skipLoadingOnRefresh: false,
          data: (data) => SizedBox(
            height: 1000,
            width: 800,
            child: TablaUsuarios(rows: usuarioGetRows(data)),
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
