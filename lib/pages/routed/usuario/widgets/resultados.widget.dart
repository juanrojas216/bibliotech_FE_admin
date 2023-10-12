import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/getAllUsuarios.controller.dart';
import '../services/get_rows.service.dart';
import 'index.dart';

class Resultados extends ConsumerWidget {
  const Resultados({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var search = ref.watch(getAllUsuariosProvider);
    
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: search.when(
              data: (data) {
                return TablaPublicaciones(rows: getRows(data));
              },
              error: (error, stackTrace) => Center(
                  child: ElevatedButton(
                      onPressed: () {
                        ref.invalidate(getAllUsuariosProvider);
                      },
                      child: Text('Reintentar cargar usuarios',
                          style: GoogleFonts.poppins()))),
              loading: () => const Center(child: CircularProgressIndicator()))),
    );
  }
}
