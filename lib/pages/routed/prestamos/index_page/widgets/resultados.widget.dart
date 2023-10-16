import 'package:bibliotech_admin/pages/routed/multa/index_page/controllers/get_multas.controller.dart';
import 'package:bibliotech_admin/pages/routed/prestamos/index_page/controllers/get_prestamos.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/get_rows.service.dart';
import 'index.dart';

class Resultados extends ConsumerWidget {
  const Resultados({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    var search = ref.watch(searchPrestamosProvider);

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: search.when(
            data: (multas) => TablaPrestamos(rows: getRows(multas)),
            error: (error, stackTrace) => Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.invalidate(searchMultasProvider);
                },
                child: Text(
                  'Reintentar cargar prestamos',
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          )),
    );
  }
}
