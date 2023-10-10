import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/get_publicaciones.controller.dart';
import '../repositoy/publicaciones.repository.dart';
import '../services/get_rows.service.dart';
import 'index.dart';

class Resultados extends ConsumerWidget {
  const Resultados({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var search = ref.watch(searchPublicacionesProvider);

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: search.when(
              data: (data) => TablaPublicaciones(rows: getRows(ref.read(publicacionesProvider))),
              error: (error, stackTrace) => Center(
                  child: ElevatedButton(
                      onPressed: () {
                        ref.invalidate(searchPublicacionesProvider);
                      },
                      child: Text('Reintentar cargar resultados',
                          style: GoogleFonts.poppins()))),
              loading: () => const Center(child: CircularProgressIndicator()))),
    );
  }
}
