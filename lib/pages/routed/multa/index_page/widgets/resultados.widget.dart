import 'package:bibliotech_admin/pages/routed/multa/index_page/controllers/get_multas.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/error_mensaje.dart';
import '../services/get_rows.service.dart';
import 'index.dart';

class Resultados extends ConsumerWidget {
  const Resultados({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var search = ref.watch(searchMultasProvider);

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: search.when(
            skipLoadingOnRefresh: false,
            data: (multas) => TablaMultas(rows: getRows(multas)),
            // error: (error, stackTrace) => Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       ref.invalidate(searchMultasProvider);
            //     },
            //     child: Text(
            //       'Reintentar cargar multas',
            //       style: GoogleFonts.poppins(),
            //     ),
            //   ),
            // ),
            error: (response, _) => ErrorResultadoWidget(
                  response: response,
                  provider: searchMultasProvider,
                  message: 'Reintentar cargar multas',
              ),
            loading: () => const Center(child: CircularProgressIndicator()),
          )),
    );
  }
}
